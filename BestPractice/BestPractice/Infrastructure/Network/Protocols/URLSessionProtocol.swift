//
//  URLSessionProtocol.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import Foundation

protocol URLSessionProtocol {
    func requestData(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}
