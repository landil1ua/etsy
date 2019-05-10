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
    
    
    let urlSession: URLSession
    let urlBuilder: URLBuilder
    let requestSender: RequestSender

    fileprivate let builder: RequestBuilder
    fileprivate let executor: RequestExecutor

    init(settingsService : AppSettingsService) {
        self.settingsService = settingsService
        urlSession = URLSession(configuration: .default)
        urlBuilder = URLBuilder(settingsService: settingsService)
        
        builder = RequestBuilder.init(endpoint: settingsService.baseEndpoint,
                                      apiKey : settingsService.apiKey)
        executor = RequestExecutor()

        requestSender = RequestSender()
    }
    
    
    
}

extension APIServiceImpl: APIService {
    func getCardDetails(for cardId: Int, completionHandler: @escaping ([Card]) -> ()) {
        requestSender.sendRequest(url: urlBuilder.buildURLForCardDetails(for: cardId), completionHandler: completionHandler)
    }
    
    func getSearchResults(for searchTerm: String, completionHandler: @escaping ([Card]) -> ()) {
        requestSender.sendRequest(url: urlBuilder.buildSearchURL(for: searchTerm), completionHandler: completionHandler)
    }
    
    
    func getCards(completionHandler: @escaping ([Card]) -> ()) {
        executor.runRequest(request: self.builder.listningList(offset: 0, limit: 50)!, completionHandler: completionHandler)
//        requestSender.sendRequest(url: urlBuilder.buildURL(uri: .listings), completionHandler: completionHandler)
    }

}

