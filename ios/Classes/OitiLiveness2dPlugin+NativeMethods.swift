//
//  OitiLiveness2dPlugin+NativeMethods.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import FaceCaptcha

extension OitiLiveness2dPlugin {
    
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
    
    func openDocumentscopy(appKey: String, environment: Environment) {
        let viewController = DocumentscopyViewController(
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
