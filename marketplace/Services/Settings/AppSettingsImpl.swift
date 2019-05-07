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
    
    
    
}

extension AppSettingsImpl : AppSettings {
    
    //Добавить Info.plist
    //Изменить базовый урл
    
    var baseEndpoint: String {
        return "https://openapi.etsy.com/v2/listings/active"
    }
    
    var apiKey: String {
        return "kmm4gja7yyezgktklwclksi8"
    }
    
    
}
