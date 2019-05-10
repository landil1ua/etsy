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
    func runRequest(request: URLRequest, completionHandler: @escaping(([Card])->())) {
        
        sessionTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else
                if let data = data {//, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    // Parse JSON response
                    let jsonResult = try JSONDecoder().decode(Response.self, from: data)
                    // reload data with completion
                    completionHandler(jsonResult.results)
                } catch {
                    print(error)
                    return
                }
            }
        }        
        sessionTask?.resume()
    }
    
}
