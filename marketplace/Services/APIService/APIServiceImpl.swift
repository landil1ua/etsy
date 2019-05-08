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
    let urlBuilder: URLBuilder
    let requestSender: RequestSender
    
    
    init() {
        settings = AppSettingsImpl()
        urlSession = URLSession(configuration: .default)
        urlBuilder = URLBuilder(appSettings: settings)
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
        requestSender.sendRequest(url: urlBuilder.buildURL(uri: .listings), completionHandler: completionHandler)
        
    }

}

