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
    
    func openFaceCaptcha(appKey: String, environment: Environment) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let viewController = FaceCaptchaViewController(
                appKey: appKey,
                environment: environment,
                delegate: self
            )
            viewController.modalPresentationStyle = .fullScreen
            self.presentViewController(viewController)
        }
    }
    
    func openDocumentscopy(ticket: String?, appKey: String, environment: Environment) {
        let viewController = DocumentscopyViewController(
            ticket: ticket,
            appKey: appKey,
            environment: environment,
            delegate: self
        )
        viewController.modalPresentationStyle = .fullScreen
        presentViewController(viewController)
    }
    
    private func presentViewController(_ viewController: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true)
    }
}
