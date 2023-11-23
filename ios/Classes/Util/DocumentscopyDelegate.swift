//
//  SwiftOitiLiveness2dPlugin+Utils.swift
//  oiti_liveness2d
//
//  Created by Gabriel Catelli Goulart on 23/11/23.
//

import Foundation
import OILiveness2D

extension SwiftOitiLiveness2dPlugin: DocumentscopyDelegate {
    
    public func handleDocumentscopyCompleted() {
        debugPrint("handleDocumentscopyCompleted")
        result?(nil)
    }
    
    public func handleDocumentscopyError(error: DocumentscopyError) {
        debugPrint("handleDocumentscopyError: \(error)")
        let (errorCode, errorMessage) = errorDetail(from: error)
        let flutterError = FlutterError(
            code: errorCode,
            message: errorMessage,
            details: nil
        )
        result?(flutterError)
    }
    
    public func handleDocumentscopyCanceled() {
        debugPrint("handleDocumentscopyCanceled")
        finishWithError(code: "DOCUMENTSCOPY_CANCELED", message: nil)
    }
    
    private func finishWithError(code: String, message: String?) {
        let flutterError = FlutterError(
            code: code,
            message: message,
            details: nil
        )
        result?(flutterError)
    }
    
    private func errorDetail(from error: DocumentscopyError) -> (String, String?) {
        switch error {
        case .invalidAppKey: return ("INVALID_APPKEY", "App Key inválido")
        case .certifaceOff: return ("CERTIFACE_OFF", "Certiface offline")
        case .cameraSetupFailed: return ("CAMERA_SETUP_FAILED", "Problema ao configurar a câmera")
        case .noCameraPermission: return ("NO_CAMERA_PERMISSION", "Não foi concedida permissão de acesso à câmera do aparelho")
        case .errorCapturePicture: return ("ERROR_CAPTURE_PICTURE", "Erro ao capturar foto")
        case .noInternetConnection: return ("NO_INTERNET_CONNECTION", "Sem conexão à Internet")
        case .validationError: return ("VALIDATION_ERROR", "Erro na requisição de validação dos desafios")
        case .faceCaptchaNotExecuted: return ("FACECAPTCHA_NOT_EXECUTED", "FaceCaptcha não foi realizada")
        @unknown default: return ("UNKNOWN_ERROR", nil)
        }
    }
}
