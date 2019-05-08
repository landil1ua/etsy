//
//  URLBuilder.swift
//  marketplace
//
//  Created by Dmitriy on 5/7/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation


class URLBuilder {
    let settings: AppSettings
    
    init(appSettings: AppSettings) {
        self.settings = appSettings
    }
    
    enum RequestsURI: String {
        case listings = "listings/active"
        case categories = "taxonomy/categories"
    }
    
    func buildURL(uri: RequestsURI, includesOptions options: [String]?) -> URL? {
        var url = "\(settings.baseEndpoint)/\(uri.rawValue)?api_key=\(settings.apiKey)"
        if let options = options {
            url += "&includes=\(options.joined(separator: ","))"
        }
        return URL(string: url)
    }
    
//    func buildURL(uri: RequestsURI, includesOptions options: [String]?, limit: Int, offset: Int) -> URL? {
//        var url = String(contentsOf: <#T##URL#>)
//        url += "&offset=50&limit=50"
//        return url
//    }
    
    
}
