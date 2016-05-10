//
//  ConfigurableCell.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation

protocol ConfigurableTableCell {
    associatedtype Model
    func configureFromModel(model: Model)
}
