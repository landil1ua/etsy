//
//  DoubleExtension.swift
//  marketplace
//
//  Created by Dmitriy on 5/10/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import Foundation


extension Double {
    func toCurrency(forCurrencyCode code: String?) -> String? {
        // number formatting
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        
        let formattedValue = formatter.string(from: NSNumber(value: self))
        
        // currency
        guard let code = code else { return formattedValue }
        let locale = NSLocale(localeIdentifier: code)
        let currency = locale.displayName(forKey: .currencySymbol, value: code)
        if let currency = currency, let formattedValue = formattedValue {
            return (currency + " " + formattedValue)
        }
        return nil
    }
}

extension String {
    func toCurrency(forCurrencyCode code: String?) -> String? {
        if let value = Double(self) {
            return value.toCurrency(forCurrencyCode: code)
        }
        return nil
    }
}
