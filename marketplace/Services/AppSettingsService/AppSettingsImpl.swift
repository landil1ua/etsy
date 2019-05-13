//
//  AppSettingsImpl.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation

class AppSettingsServiceImpl {
    
    init() {
        
    }
    
    fileprivate func readValueFromPList(name: String, fromPlist plist: String) -> String {
        let path = Bundle.main.path(forResource: plist, ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)!
        return dict.object(forKey: name) as! String
        
    }
    
    
}

extension AppSettingsServiceImpl : AppSettingsService {

    var baseEndpoint: String {
        return readValueFromPList(name: "etsyBaseEndpoint", fromPlist: "Info")
    }
    
    var apiKey: String {
        return readValueFromPList(name: "etsyAPIKey", fromPlist: "Info")
    }
    
    
}
