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
    let currency: String?
    let url: String?
    var images: Image?
    private var user: User?
    var score: Int? {
        return user?.feedbackInfo?.score
    }
    var reviewsCount: Int? {
        return user?.feedbackInfo?.reviewsCount
    }
    private var shop: Shop?
    var shopName: String? {
        return shop?.shopName
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case currency = "currency_code"
        case url
        case images = "MainImage"
        case user = "User"
        case shop = "Shop"
    }
}

class Image: Codable { // CardImage with several images (not one)
    let littleImage: String?
    let mediumImage: String?
    let fullSizeImage: String?
    
    enum CodingKeys: String, CodingKey {
        case littleImage = "url_170x135"
        case mediumImage = "url_570xN"
        case fullSizeImage = "url_fullxfull"
    }
}


class User: Codable {
    let feedbackInfo: Feedback?
    
    enum CodingKeys: String, CodingKey {
        case feedbackInfo = "feedback_info"
    }
}


class Feedback: Codable {
    let score: Int?
    let reviewsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case score
        case reviewsCount = "count"
    }
}

class Shop: Codable {
    let shopName: String?
    
    enum CodingKeys: String, CodingKey {
        case shopName = "shop_name"
        
    }
}


