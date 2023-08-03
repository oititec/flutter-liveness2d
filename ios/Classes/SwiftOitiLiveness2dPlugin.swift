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
        
      let DocumentscopyViewController = HybridDocumentscopyViewController(ticket: ticket, appKey: appKey, environment: Environment.HML, delegate: self)
        DocumentscopyViewController.delegate = self
        DocumentscopyViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(DocumentscopyViewController, animated: true, completion: nil)
       
        
  }
    
    

  
}
