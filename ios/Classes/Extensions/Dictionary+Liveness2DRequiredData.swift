//
//  Dictionary+Liveness2DRequiredData.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation
import FaceCaptcha

extension Dictionary<String, String> {
    func toModel() throws -> Liveness2DRequiredData {
        guard let appKey = self["appkey"] else {
            throw Liveness2DRequiredData.Throwing.missingAppKey
        }
        guard let environmentString = self["env"] else {
            throw Liveness2DRequiredData.Throwing.missingEnvironment
        }
        guard let environment = Environment.decode(from: environmentString) else {
            throw Liveness2DRequiredData.Throwing.invalidEnvironment
        }
        
        return Liveness2DRequiredData(
            appKey: appKey,
            environment: environment
        )
    }
}
