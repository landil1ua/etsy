//
//  CardModel.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation


struct Response: Codable {
    let count: Int?
    let results: [Card]
}

struct Card: Codable {
    let title: String?
    let price: String?
    let currency_code: String?
    let url: String?
    var MainImage: Image 
}

struct Image: Codable {
    let url_fullxfull: String?
}
