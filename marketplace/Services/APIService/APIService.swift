//
//  APIService.swift
//  marketplace
//
//  Created by Dmitriy on 5/6/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

protocol APIService {
    
    func getCards(completionHandler: @escaping ([Card])->())
    
}
