//
//  CellInterface.swift
//  marketplace
//
//  Created by Dmitriy on 4/25/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation
import UIKit

protocol CellInterface {
    
    static var id: String { get }
    static var cellNib: UINib { get }
    
}

extension CellInterface {
    
    static var id: String {
        return String.init(describing: self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
}
