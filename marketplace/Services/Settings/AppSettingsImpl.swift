//
//  AppSettingsImpl.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation

class AppSettingsImpl {
    
    init() {
        
    }
    
    fileprivate func readValueFromPList(name: String, fromPlist plist: String) -> String {
        let path = Bundle.main.path(forResource: plist, ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: path)!
        return dict.object(forKey: name) as! String
        
    }
    
    
}

extension AppSettingsImpl : AppSettings {
    
    //Добавить Info.plist
    //Изменить базовый урл
    
    var baseEndpoint: String {
        return readValueFromPList(name: "etsyBaseEndpoint", fromPlist: "Info")
    }
    
    var apiKey: String {
        return readValueFromPList(name: "etsyAPIKey", fromPlist: "Info")
    }
    
    
}
