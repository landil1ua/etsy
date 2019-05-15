//
//  RequestExecutor.swift
//  marketplace
//
//  Created by Michael Liptuga on 5/9/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
class RequestExecutor {
    
    // MARK:
    fileprivate let queue: DispatchQueue
    fileprivate let session: URLSession
    fileprivate var sessionTask: URLSessionDataTask?
    
    //MARK:
    init() {
        queue = DispatchQueue.global(qos: .utility)
        session = URLSession(configuration: .default)
    }
    
    //MARK:
    func runRequest(request: URLRequest, completionHandler: @escaping(completion)) {
        sessionTask?.cancel()
        
        sessionTask = session.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                completionHandler(ResponseError(error: error), nil, nil)
            }
            if let data = data {
                do {
                    // Parse JSON response
                    let jsonResult = try JSONDecoder().decode(Response.self, from: data)
                    // reload data with completion
                    completionHandler(nil, jsonResult.count, jsonResult.results)
                } catch {
                    completionHandler(ResponseError(error: error), nil, nil)
                }
            }
        }
        sessionTask?.resume()
    }
}
