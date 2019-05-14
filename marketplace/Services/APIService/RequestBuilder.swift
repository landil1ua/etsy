//
//  RequestBuilder.swift
//  marketplace
//
//  Created by Michael Liptuga on 5/9/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

class RequestBuilder {
    
    // MARK:
    let endpoint: String
    let apiKey : String
    
    // MARK:
    init(endpoint: String, apiKey : String) {
        self.endpoint = endpoint
        self.apiKey = apiKey
    }
    
    // MARK: - Requests
    func listingList (offset: Int, limit: Int) -> URLRequest? {
        let parameters = ["offset": offset,
                          "limit" : limit,
                          "includes" : "MainImage,User,Shop"] as [String : Any]
        
        return self.GETRequest(url: self.requestUrlWithParameters(path: "/listings/active", parameters: parameters))
    }
    
    func listingProductDetails(for cardId: Int) -> URLRequest? {
        let parameters = ["includes" : "MainImage,Images"] as [String : Any]
        return self.GETRequest(url: self.requestUrlWithParameters(path: "/listings/\(cardId)", parameters: parameters))
    }
    
    func searchResultsList(keywords: String, offset: Int, limit: Int) -> URLRequest? {
        let parameters = [ "keywords": keywords,
                           "offset": offset,
                           "limit" : limit,
                           "includes" : "MainImage"] as [String : Any]
        return self.GETRequest(url: self.requestUrlWithParameters(path: "/listings/active", parameters: parameters))
    }
    
}


fileprivate extension RequestBuilder {
    
    // MARK: Request URL
    func requestUrlWithParameters(path: String, parameters : [String : Any]?) -> URL? {
        var params : [String : Any] = ["api_key" : apiKey]
        if let parameters = parameters {
            params = params.merging(parameters, uniquingKeysWith: { $1 })
        }
        let urlString = endpoint + path + "?" + params.percentEscaped()
        return URL.init(string: urlString)
    }
    
    func requestUrl(path: String) -> URL? {
        return URL.init(string: endpoint + path)
    }
    
    
    // MARK: Requests
    func GETRequest (url : URL?) -> URLRequest? {
        if let url =  url {
            var request : URLRequest = URLRequest.init(url: url)
            request.httpMethod = "GET"
            request.timeoutInterval = 60
            return request
        }
        return nil
    }
    
    func request (httpMethod : String, url : URL?, parameters : [String : Any]?) -> URLRequest? {
        if let url =  url {
            var request : URLRequest = URLRequest.init(url: url)
            request.httpMethod = httpMethod
            request.timeoutInterval = 60
            if let paramentrs = parameters {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: paramentrs, options: .prettyPrinted)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            return request
        }
        return nil
    }
    
}
