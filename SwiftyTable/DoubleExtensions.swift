//
//  DoubleExtensions.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation

extension Double {
    func toCurrencyFormattedString() -> String {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = .CurrencyStyle
        numFormatter.usesSignificantDigits = false
        numFormatter.minimumSignificantDigits = 3
        numFormatter.maximumFractionDigits = 2
        return numFormatter.stringFromNumber(self) ?? numFormatter.stringFromNumber(0)!
    }
}