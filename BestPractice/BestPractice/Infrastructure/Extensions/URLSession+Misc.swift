//
//  URLSession+Misc.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import Foundation

extension URLSession: URLSessionProtocol {
    func requestData(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
