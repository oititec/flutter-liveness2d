import Flutter
import UIKit
import OILiveness2D
import OICommons
import OIComponents
import AVFoundation

public class SwiftOitiLiveness2dPlugin: NSObject, FlutterPlugin, FaceCaptchaDelegate, UINavigationControllerDelegate {
    var result: FlutterResult?;
    
    public func handleSuccess(model: FaceCaptchaSuccessModel){
        debugPrint("handleCaptureValidation: \(model)")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
        self.result?("FaceCaptcha Concluído")
    }
    
    public func handleError(error: FaceCaptchaError){
        debugPrint("handleCaptureVideoError: \(error)")
        let flutterError = FlutterError(
            code: "0",
            message: "\(error)",
            details: nil
        )
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
        self.result?(flutterError)
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
        let appKey = args?["appKey"] as! String
        let rawEnvironment = args?["environment"] as? String ?? ""
        let environment = Environment(rawValue: rawEnvironment) ?? .HML
        
        let FaceCaptchaViewController = HybridFaceCaptchaViewController(appKey: appKey, environment: environment, delegate: self)
        FaceCaptchaViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(FaceCaptchaViewController, animated: true, completion: nil)
    }
    
    private func startdocumentscopy(args:Dictionary<String,Any>?) {
        let appKey = args?["appKey"] as? String ?? ""
        let ticket = args?["ticket"] as? String ?? nil
        let custom = args?["theme"] as? Dictionary<String,Any> ?? nil
        let rawEnvironment = args?["environment"] as? String ?? ""
        let environment = Environment(rawValue: rawEnvironment) ?? .HML
        
        let builder = DocumentscopyCustomizationBuilder.builder()
        let hybridCustomization = HybridDocumentscopyCustomizationBuilder.builder(withNativeBuilder: builder)
        
        DispatchQueue.main.async { [self] in
            let DocumentscopyViewController = HybridDocumentscopyViewController(
                ticket: ticket == "" ? nil : ticket,
                appKey: appKey,
                environment: environment,
                delegate: self,
                customizationTheme: (custom != nil) ? createCustomization(builder: builder,hybridBuilder: hybridCustomization, custom: custom).build() : nil
            )
            DocumentscopyViewController.delegate = self
            DocumentscopyViewController.modalPresentationStyle = .fullScreen
            UIApplication.shared.keyWindow?.rootViewController?.present(DocumentscopyViewController, animated: true, completion: nil)
        }
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
