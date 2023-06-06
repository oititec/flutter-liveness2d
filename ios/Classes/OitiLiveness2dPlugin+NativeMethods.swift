//
//  OitiLiveness2dPlugin+NativeMethods.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import Flutter
import FaceCaptcha
import OIObservability

extension OitiLiveness2dPlugin {
    
    func runMethod(with appKey: String, environment: Environment, method: NativeMethod) {
        switch method {
        case .openFaceCaptcha:
            openFaceCaptcha(with: appKey, environment: environment)
        case .openDocumentscopy:
            openDocumentscopy(with: appKey, environment: environment)
        default:
            break
        }
    }
    
    func recordEvent(event: String, result: @escaping FlutterResult) {
        guard let eventType = EventTypes(rawValue: event) else {
            result(MethodResponse.error)
            return
        }
        
        let parameters: [String: Any] = [
            "source": "Flutter/iOS",
            "timestamp": Date().timeIntervalSince1970
        ]
        print("Observability Event -> \(eventType.rawValue)")
        EventConfiguration()
            .eventManager
            .logEvent(type: eventType, parameters: parameters)
        
        result(MethodResponse.success)
    }
    
    private func openFaceCaptcha(with appKey: String, environment: Environment) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let viewController = FaceCaptchaViewController(
                appKey: appKey,
                baseURL: self.baseUrl(from: environment),
                delegate: self
            )
            viewController.modalPresentationStyle = .fullScreen
            self.presentViewController(viewController)
        }
    }
    
    private func openDocumentscopy(with appKey: String, environment: Environment) {
        let viewController = HybridDocumentscopyViewController(
            appKey: appKey,
            baseURL: baseUrl(from: environment),
            delegate: self
        )
        viewController.modalPresentationStyle = .fullScreen
        presentViewController(viewController)
    }
    
    private func baseUrl(from environment: Environment) -> String {
        switch environment {
        case .HML: return "https://comercial.certiface.com.br"
        case .PRD: return "https://certiface.com.br"
        }
    }
    
    private func presentViewController(_ viewController: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true)
    }
}
