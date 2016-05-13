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
        (model: U) -> T {

        //every UITableViewCell has been extended to conform to ReusableView protocol
        //which has this static reuseIdentifier computed property on it.
        //Why I need to do this cast is beyond me, T.reuseIdentifier or T.Type.reuseIdentigier seems
        //like it should work, but it doesn't.
        let reuseIdentifier = (T.self as UITableViewCell.Type).reuseIdentifier
        print("reuseIdentifier is \(reuseIdentifier)")
        let retVal = self.dequeueReusableCellWithIdentifier(reuseIdentifier) as? T
        
        guard let val = retVal else {
            fatalError("couldn't dequeue cell with reuseIdentifier: \(reuseIdentifier)")
        }

        val.configureFromModel(model)
        return val
    }
}
