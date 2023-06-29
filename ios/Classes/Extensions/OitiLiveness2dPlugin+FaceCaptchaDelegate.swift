//
//  OitiLiveness2dPlugin+FaceCaptchaDelegate.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import UIKit
import FaceCaptcha

extension OitiLiveness2dPlugin: FaceCaptchaDelegate {
    public func handleFaceCaptchaValidation(validateModel: FaceCaptcha.FCValidCaptchaModel) {
        print("[FaceCaptchaDelegate] -> Validation: \(validateModel)")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
    
    public func handleFaceCaptchaError(error: FaceCaptcha.FaceCaptchaError) {
        print("[FaceCaptchaDelegate] -> Error: \(error)")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
    
    public func handleFaceCaptchaCanceled() {
        print("[FaceCaptchaDelegate] -> Canceled")
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
    }
}
