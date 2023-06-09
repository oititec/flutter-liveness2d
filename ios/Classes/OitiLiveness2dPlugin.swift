import Foundation
import Flutter

public class OitiLiveness2dPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "oiti_liveness2d", binaryMessenger: registrar.messenger())
        let instance = OitiLiveness2dPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let method = NativeMethod(rawValue: call.method) {
            switch method {
            case .openFaceCaptcha:
                if let dict = call.arguments as? Dictionary<String, String> {
                    do {
                        let data = try dict.toModel()
                        openFaceCaptcha(appKey: data.appKey, environment: data.environment)
                        result(MethodResponse.success)
                    } catch {
                        result(MethodResponse.error)
                    }
                } else {
                    result(MethodResponse.error)
                }
            case .openDocumentscopy:
                if let dict = call.arguments as? Dictionary<String, String> {
                    do {
                        let data = try dict.toModel()
                        openDocumentscopy(
                            ticket: data.ticket,
                            appKey: data.appKey,
                            environment: data.environment
                        )
                        result(MethodResponse.success)
                    } catch {
                        result(MethodResponse.error)
                    }
                } else {
                    result(MethodResponse.error)
                }
            case .recordEvent:
                if let dict = call.arguments as? Dictionary<String, String>,
                   let event = dict["event"]
                {
                    recordEvent(event: event, result: result)
                } else {
                    result(MethodResponse.error)
                }
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
