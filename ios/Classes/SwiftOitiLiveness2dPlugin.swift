import Flutter
import UIKit
import OILiveness2D
import OICommons
import OIComponents
import AVFoundation

public class SwiftOitiLiveness2dPlugin: NSObject, FlutterPlugin, FaceCaptchaDelegate, DocumentscopyDelegate, UINavigationControllerDelegate {
    private var result: FlutterResult?;


  /// Callback chamada em caso de Documentoscopia concluída..
    public func handleDocumentscopyCompleted() {
        debugPrint("handleDocumentscopyCompleted")
    }
    
    /// Callback chamada em caso de erro durante execução da Documentoscopia.
    /// - Parameters:
    ///   - error: Erro ocorrido
    public func handleDocumentscopyError(error: DocumentscopyError) {
        debugPrint("handleDocumentscopyError: \(error)")
      
        
    }
    
    /// Callback chamada ao clicar no botão de cancelar/fechar.
    public func handleDocumentscopyCanceled() {
        debugPrint("handleDocumentscopyCanceled")
    }
    
    public func handleSuccess(model: FaceCaptchaSuccessModel){
        debugPrint("handleCaptureValidation: \(model)")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
        self.result?("FaceCaptcha Concluído")
    }

    public func handleError(error: FaceCaptchaError){
        debugPrint("handleCaptureVideoError: \(error)")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
        self.result?("FaceCaptcha Falhou")
    }

    /// Método que lida com o cancelamento do fluxo de reconhecimento facial por parte do usuário.
    public func handleCanceled() {
        debugPrint("handleCaptureCanceled")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
        self.result?(FlutterError(code: "USER_CANCELLED", message: "USER_CANCELLED", details: nil))
    }
 
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "oiti_liveness2d", binaryMessenger: registrar.messenger())
    let instance = SwiftOitiLiveness2dPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.result = result;
        
        switch call.method {
        case "OITI.startLiveness2d":
            if let args = call.arguments as? Dictionary<String,Any> {
                startliveness2d(args: args)
            } else {
                var error:Dictionary<String,Any> = Dictionary();
                error["message"] =
                "Something went wrong. Check Plugin Interface";
                result(error)
            }

        case "OITI.startDocumentscopy":
            if let args = call.arguments as? Dictionary<String,Any> {
                startdocumentscopy(args: args)
            } else {
                var error:Dictionary<String,Any> = Dictionary();
                error["message"] =
                "Something went wrong. Check Plugin Interface";
                result(error)
            }
        case "OITI.checkPermission":
            if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
                result(true)
            } else {
                result(false)
            }
        case "OITI.askPermission":
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                if response {
                    result(true)
                    
                } else {
                    result(false)
                }
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
        
    }

  private func startliveness2d(args:Dictionary<String,Any>?) {
        let appKey = args?["appKey"] as? String ?? ""
        
      let FaceCaptchaViewController = HybridFaceCaptchaViewController(appKey: appKey, environment: Environment.HML, delegate: self)
      FaceCaptchaViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(FaceCaptchaViewController, animated: true, completion: nil)
       
        
  }
  private func startdocumentscopy(args:Dictionary<String,Any>?) {
      let appKey = args?["appKey"] as? String ?? ""
      let ticket = args?["ticket"] as? String ?? ""
      let custom = args?["theme"] as? Dictionary<String,Any> ?? nil
      
      let builder = DocumentscopyCustomizationBuilder.builder()
      
      DispatchQueue.main.async { [self] in
      let DocumentscopyViewController = HybridDocumentscopyViewController(
        ticket: ticket,
        appKey: appKey,
        environment: Environment.HML,
        delegate: self,
        customizationTheme: createCustomization(builder: builder, custom: custom
        ).build())
        DocumentscopyViewController.delegate = self
        DocumentscopyViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(DocumentscopyViewController, animated: true, completion: nil)
      }
  }
    
    func createCustomization(
        builder: DocumentscopyCustomizationBuilder,
        custom: Dictionary<String,Any>?
    ) -> DocumentscopyCustomizationBuilder {
        builder
            .setLoadingBackgroundColor(.init(hex: custom?["setLoadingBackgroundColor"] as? String ?? ""))
            .setCaptureBackgroundColor(.init(hex: custom?["setCaptureBackgroundColor"] as? String ?? ""))
            .setCaptureFrontIndicatorText(custom?["setTextFront"] as? String ?? "")
            .setCaptureBackIndicatorText(custom?["setTextBack"] as? String ?? "")
            .setCaptureInstructionGuideText(custom?["setCaptureInstructionGuideText"] as? String ?? "")
            .setCaptureInstructionConfirmationText(custom?["setTextOk"] as? String ?? "")
            .setCaptureTakeNewPictureButton(withText: custom?["setTextRedo"] as? String ?? "")
            .setCaptureInstructionTextColor(.init(hex: custom?["setCaptureInstructionGuideTextColor"] as? String ?? ""))
            .setCaptureConfirmationMessage(
                withText: custom?["setTextConfirmation"] as? String ?? "",
                color: .init(hex:  custom?["setBackgroundOkColor"] as? String ?? "")
            )
        
        return builder
    }
    
}


public extension UIColor {
    
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
