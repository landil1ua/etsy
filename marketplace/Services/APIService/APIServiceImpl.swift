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
    
    fileprivate var settingsService: AppSettingsService
    
    
    fileprivate let urlSession: URLSession
    
    fileprivate let builder: RequestBuilder
    fileprivate let executor: RequestExecutor
    
    init(settingsService : AppSettingsService) {
        self.settingsService = settingsService
        urlSession = URLSession(configuration: .default)
        
        builder = RequestBuilder.init(endpoint: settingsService.baseEndpoint,
                                      apiKey : settingsService.apiKey)
        executor = RequestExecutor()
    }
    
    
    
}

extension APIServiceImpl: APIService {
    func receiveCards(offset: Int, limit: Int, completionHandler: @escaping completion) {
        if let url = self.builder.listingList(offset: offset, limit: limit) {
            self.executor.runRequest(request: url, completionHandler: completionHandler)
        }
    }
    
    func receiveCardDetails(for cardId: Int, completionHandler: @escaping completion) {
        if let url = self.builder.listingProductDetails(for: cardId) {
            self.executor.runRequest(request: url, completionHandler: completionHandler)
        }
    }
    
    func receiveSearchResults(offset: Int, limit: Int, for searchTerm: String, completionHandler: @escaping completion) {
        if let url = self.builder.searchResultsList(keywords: searchTerm, offset: offset, limit: limit) {
            self.executor.runRequest(request: url, completionHandler: completionHandler)
        }
    }
    
    
    
    
    
    
    
}

