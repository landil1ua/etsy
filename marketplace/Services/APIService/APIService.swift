//
//  APIService.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

typealias completion = (ResponseError?, [Card]?) -> ()

protocol APIService {
    
    
    
    func receiveCards(offset: Int, limit: Int, completionHandler: @escaping completion)
    func receiveCardDetails(for cardId: Int, completionHandler: @escaping completion)
    func receiveSearchResults(offset: Int, limit: Int, for searchTerm: String, completionHandler: @escaping completion)
    
}

