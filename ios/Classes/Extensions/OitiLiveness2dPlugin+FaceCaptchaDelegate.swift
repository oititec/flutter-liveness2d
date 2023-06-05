//
//  OitiLiveness2dPlugin+FaceCaptchaDelegate.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import FaceCaptcha

extension OitiLiveness2dPlugin: FaceCaptchaDelegate {
    public func handleFaceCaptchaValidation(validateModel: FaceCaptcha.FCValidCaptchaModel) { }
    
    public func handleFaceCaptchaError(error: FaceCaptcha.FaceCaptchaError) { }
    
    public func handleFaceCaptchaCanceled() { }
}
