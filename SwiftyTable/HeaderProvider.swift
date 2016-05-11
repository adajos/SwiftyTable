//
//  HeaderProvider.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/11/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation

protocol HeaderProvider: RawRepresentable {
    var title: String {get}
    init?(rawValue: Int)
}
