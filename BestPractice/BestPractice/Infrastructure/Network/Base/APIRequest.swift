//
//  APIRequest.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import Foundation

struct APIRequest {

    // MARK: - Internal Properties

    let url: String
    let method: HTTPMethod
    let headers: [String: String]
    let parameters: [String: Any]
    let body: Data?

    // MARK: - Private Properties

    private let baseURL: BaseURL
    private let path: Path

    // MARK: - Initializer

    init(
        path: Path,
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        parameters: [String: Any] = [:],
        body: Data? = nil,
        baseURL: BaseURL = .primary
    ) {
        self.baseURL = baseURL
        self.path = path
        self.url = baseURL.rawValue + path.rawValue
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.body = body
    }

    // MARK: - URLRequest Conversion

    var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        if !parameters.isEmpty {
            urlComponents?.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }

        guard let finalURL = urlComponents?.url else {
            return nil
        }

        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body

        return request
    }
}
