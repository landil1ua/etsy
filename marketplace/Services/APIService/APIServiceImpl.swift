//
//  APIServiceImpl.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

class APIServiceImpl {
    
    let settings: AppSettings
    let urlSession: URLSession
    var dataTask: URLSessionDataTask?
    let urlBuilder: URLBuilder?
    
    var results: [Card]?
    
    init() {
        settings = AppSettingsImpl()
        urlSession = URLSession(configuration: .default)
        urlBuilder = URLBuilder(appSettings: settings)
    }
    
    
    
}

extension APIServiceImpl: APIService {
    
    
    func getCards(completionHandler: @escaping ([Card])->()) {
        //Узнать что выполняется в каждом методе, который был вызван ниже
        dataTask?.cancel()
        
        // create full URL with keys
        let url = urlBuilder?.buildURL(uri: .listings, options: ["MainImage"])

        // create new data task with full URL
        dataTask = urlSession.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    // Parse JSON response
                    let cards = try JSONDecoder().decode(Response.self, from: data)
                    
                    // reload data with completion
                    completionHandler(cards.results)
                } catch {
                    print(error)
                    return
                }
            }
            
        }
        dataTask?.resume()
    }
    
    
    
}

