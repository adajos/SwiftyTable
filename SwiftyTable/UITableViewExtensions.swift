//
//  UITableViewExtensions.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/13/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueAndConfigureCell<T: UITableViewCell, U where T: ConfigurableTableCell, U == T.Model>
        (cellType: UITableViewCell.Type, model: U) -> T {
        
        print("cellType is \(cellType) cellType \(cellType.reuseIdentifier)")
        let retVal = self.dequeueReusableCellWithIdentifier(cellType.reuseIdentifier) as? T
        
        guard let val = retVal else {
            fatalError("couldn't dequeue cell with reuseIdentifier: \(cellType.reuseIdentifier)")
        }
        
        val.configureFromModel(model)
        return val
    }
}
