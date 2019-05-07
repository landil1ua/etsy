//
//  CardModel.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation

// Исправить названия, создать отдельные классы

class Response: Codable { // Base response
    let count: Int?
    let results: [Card]
}

class Card: Codable { // Card
    let title: String?
    let price: String?
    let currency_code: String?
    let url: String?
    var MainImage: Image 
}

class Image: Codable { // CardImage with several images (not one)
    let url_fullxfull: String?
}
