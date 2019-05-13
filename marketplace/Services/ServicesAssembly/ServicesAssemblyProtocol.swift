//
//  ServicesAssemblyProtocol.swift
//  marketplace
//
//  Created by Michael Liptuga on 5/9/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

protocol ServicesAssemblyProtocol {
    
    var application: UIApplication { get }
    //All Available Services should be here like
    var settingsService: AppSettingsService { get }
    var apiService: APIService { get }
}
