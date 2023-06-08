//
//  OitiLiveness2dPlugin+DocumentscopyDelegate.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import FaceCaptcha

extension OitiLiveness2dPlugin: DocumentscopyDelegate {
    public func handleDocumentscopyCompleted() {
        print("[DocumentscopyDelegate] -> Completed")
    }
    
    public func handleDocumentscopyError(error: FaceCaptcha.DocumentscopyError) {
        print("[DocumentscopyDelegate] -> Error: \(error)")
    }
    
    public func handleDocumentscopyCanceled() {
        print("[DocumentscopyDelegate] -> Canceled")
    }
}