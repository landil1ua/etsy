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
    
    
   
    func buildSearchURL(for keywords: String) -> URL {
        var url = "\(buildURL(uri: .listings))"
        let searchString = keywords.replacingOccurrences(of: " ", with: "%20")
        url += "&keywords=\(searchString)"
        
        return URL(string: url)!
    }
    
    func buildURLForCardDetails(for cardId: Int) -> URL {
        let url = "\(settings.baseEndpoint)/listings/\(cardId)?api_key=\(settings.apiKey)&includes=MainImage"
        
        return URL(string: url)!
    }
    
    
    func buildURL(uri: RequestsURI) -> URL {
        
        let url = "\(settings.baseEndpoint)\(uri.rawValue)?api_key=\(settings.apiKey)&includes=MainImage"
        return (URL(string: url)!)
    }
    
    
}
