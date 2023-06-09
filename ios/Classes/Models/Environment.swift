//
//  Environment.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import FaceCaptcha

extension Environment {
    static func decode(from value: String) -> Environment? {
        switch value {
        case "hml": return .HML
        case "prd": return .PRD
        default: return nil
        }
    }
}
