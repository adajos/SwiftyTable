//
//  Apple.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation

enum AppleQuality : Int {
    case Fresh
    case Old
    case Rotten
    
    var title: String {
        switch self {
        case .Fresh: return "Fresh"
        case .Old: return "Old"
        case .Rotten: return "Rotten"
        }
    }
}

struct Apple {
    let name: String
    let price: Double
    let quality: AppleQuality
}
