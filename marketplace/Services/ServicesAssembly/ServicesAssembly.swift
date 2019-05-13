//
//  ServicesAssembly.swift
//  marketplace
//
//  Created by Michael Liptuga on 5/9/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

struct ServicesAssembly {
    
    static var shared: ServicesAssemblyProtocol {
        return _services
    }
    
    // MARK:
    static func setup(application: UIApplication) {
        _services = ServicesAssemblyImpl(application: application)
    }
    
    // MARK:
    static fileprivate var _services: ServicesAssemblyProtocol!
}
