//
//  RequestExecutor.swift
//  marketplace
//
//  Created by Dmitriy on 5/8/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//


//let settings: AppSettings
//let urlSession: URLSession
//var dataTask: URLSessionDataTask?
//let urlBuilder: URLBuilder? +

import Foundation

class RequestSender {
    // MARK: Variables
    fileprivate let queue: DispatchQueue
    fileprivate let session: URLSession
    fileprivate var sessionTask: URLSessionDataTask?
    
    // MARK: Init
    init() {
        queue = DispatchQueue.global(qos: .utility)
        session = URLSession(configuration: .default)
    }
    
    // MARK: sendRequest
    func sendRequest(url: URL, completionHandler: @escaping(([Card])->())) {
        
        print("request: \(url)")
        
        sessionTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
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
