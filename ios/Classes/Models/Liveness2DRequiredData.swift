//
//  Liveness2DRequiredData.swift
//  oiti_liveness2d
//
//  Created by Vitor Souza on 02/06/23.
//

import Foundation

struct Liveness2DRequiredData {
    let appKey: String
    let environment: Environment
}

// Errors
extension Liveness2DRequiredData {
    enum Throwing: Error {
        case invalidAppKey
        case invalidEnvironment
    }
}
