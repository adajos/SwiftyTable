//
//  UITableViewExtensions.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/13/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

protocol CellDequeueable {
    func dequeueAndConfigureCell<T: UITableViewCell, U where T: ConfigurableTableCell, U == T.Model>
        (model: U) -> T
}

//TODO: revisit this. Why is it better to have UITableView conform to CellDequeuable and get the func
//via an extension on the protocol itself (with Self requirements) vs defining the func on the protocol and
//putting that bad boy right on the UITableView itself and THEN extending it to conform to the protocol?
extension UITableView: CellDequeueable {}

extension CellDequeueable where Self: UITableView {
    func dequeueAndConfigureCell<T: UITableViewCell, U where T: ConfigurableTableCell, U == T.Model>
        (model: U) -> T {
        
        //every UITableViewCell has been extended to conform to ReusableView protocol
        //which has this static reuseIdentifier computed property on it.
        //Why I need to do this cast is beyond me, T.reuseIdentifier or T.Type.reuseIdentifier seems
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

//extension UITableView {
//    func dequeueAndConfigureCell<T: UITableViewCell, U where T: ConfigurableTableCell, U == T.Model>
//        (model: U) -> T {
//
//        //every UITableViewCell has been extended to conform to ReusableView protocol
//        //which has this static reuseIdentifier computed property on it.
//        //Why I need to do this cast is beyond me, T.reuseIdentifier or T.Type.reuseIdentifier seems
//        //like it should work, but it doesn't.
//        let reuseIdentifier = (T.self as UITableViewCell.Type).reuseIdentifier
//        print("reuseIdentifier is \(reuseIdentifier)")
//        let retVal = self.dequeueReusableCellWithIdentifier(reuseIdentifier) as? T
//        
//        guard let val = retVal else {
//            fatalError("couldn't dequeue cell with reuseIdentifier: \(reuseIdentifier)")
//        }
//
//        val.configureFromModel(model)
//        return val
//    }
//}
