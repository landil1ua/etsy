//
//  ResponseError.swift
//  marketplace
//
//  Created by Dmitriy on 5/13/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation


class ResponseError {
    private let _errorTitle: String?
    
    
    init(error: Error) {
        _errorTitle = error.localizedDescription
    }
    
    var errorDescription: String? {
        if let errorTitle = _errorTitle {
            return ("Error: \(errorTitle)")
        }
        return nil
    }
}
