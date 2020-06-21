//
//  MovieXError.swift
//  MovieX
//
//  Created by Legna Filloy on 6/20/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import Foundation

enum MovieXError: Error {
    case general
    case noSession
    case unauthorized(message: String?)
    case noConnection
    case serverException(message: String?)
    case notFound(message: String?)
    case unknown(message: String?)
    case parsing(message: String?)
    case doNothing
    case api(message: String?)
    
    case errorWithServerMessage(String)
}

extension MovieXError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .general: return "Error.Message".localized
        case .noSession: return "Error.Message".localized
        case let .unauthorized(message): return String(format: "Error.Description".localized, message ?? "")
        case .noConnection: return "Error.NoConnection.Message".localized
        case let .serverException(message): return String(format: "Error.Description".localized, message ?? "")
        case let .notFound(message): return String(format: "Error.Description".localized, message ?? "")
        case let .unknown(message): return String(format: "Error.Description".localized, message ?? "")
        case let .parsing(message): return String(format: "Error.Description".localized, message ?? "")
        case .doNothing: return nil
        case let .api(message): return String(format: "Error.Api".localized, message ?? "")
        default: return "Error.Message".localized
        }
    }
}

