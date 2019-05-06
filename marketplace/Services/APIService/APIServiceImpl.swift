//
//  APIServiceImpl.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation

class APIServiceImpl {
    
    let settings: AppSettings
    let urlSession: URLSession
    var dataTask: URLSessionDataTask?
    
    var results: [Card]?
    
    init() {
        settings = AppSettingsImpl()
        urlSession = URLSession(configuration: .default)
    }
    
    
    
}

extension APIServiceImpl: APIService {
    
    func getCards() {
        dataTask?.cancel()
        
        
        if var urlComponents = URLComponents(string: settings.baseEndpoint) {
            urlComponents.query = "api_key=\(settings.apiKey)&includes=MainImage"
            
            guard let url = urlComponents.url else { return }
            
            dataTask = urlSession.dataTask(with: url) {
                data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    do {
                        let cards = try JSONDecoder().decode(Response.self, from: data)
                        cards.results.forEach({ (card) in
                            print("\(card.title!)\n\(card.price!) \(card.currency_code!)\n\(card.MainImage.url_fullxfull!)")
                            print("---------------")
                        })
                        
                    } catch {
                        print(error)
                        return
                    }
                    
                    
                    
                }
                
            }
        }
        
        dataTask?.resume()
    }
}
