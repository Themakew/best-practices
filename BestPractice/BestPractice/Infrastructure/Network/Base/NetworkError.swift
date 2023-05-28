//
//  NetworkError.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import Foundation

extension NSError {
    convenience init(networkError: NetworkError) {
        let domain = "com.bestPractices.network"
        var code = 0
        var userInfo: [String: Any] = [:]

        switch networkError {
        case .urlError:
            code = 1
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString("Network Error: Invalid URL", comment: "")
        case let .httpResponseError(statusCode):
            code = 2
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString("Network Error: HTTP Code \(statusCode)", comment: "")
        case .decodeError:
            code = 3
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString("Network Error: Decode Error", comment: "")
        case let .genericError(error):
            code = 4
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedString("Network Error: \(error)", comment: "")
        }

        self.init(domain: domain, code: code, userInfo: userInfo)
    }
}

enum NetworkError: Error {
    case urlError
    case httpResponseError(statusCode: Int)
    case decodeError
    case genericError(error: String)
}
