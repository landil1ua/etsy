//
//  ServicesAssemblyImpl.swift
//  marketplace
//
//  Created by Michael Liptuga on 5/9/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

class ServicesAssemblyImpl: ServicesAssemblyProtocol {
    
    let application: UIApplication
    //All Available Services should be here like
    let settingsService: AppSettingsService
    let apiService: APIService
    
    init(application: UIApplication) {
        self.application = application
        settingsService = AppSettingsServiceImpl()
        apiService = APIServiceImpl(settingsService: settingsService)        
    }
    
}
