//
//  AppSettings.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation

protocol AppSettings {
    
    var baseEndpoint : String { get }
    var apiKey       : String { get }
    
}
