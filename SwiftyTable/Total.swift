//
//  Total.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/12/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation

struct Total {
    let numberOfVarieties: Int
    let averagePrice: Double
    
    static func create(apples:[Apple]) -> Total {
        return Total(numberOfVarieties: apples.count, averagePrice: (apples.reduce(0) { $0 + $1.price }) / Double(apples.count))
    }
}



