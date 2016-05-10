//
//  TabularData.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation
import UIKit

protocol TabularData: UITableViewDataSource {
    associatedtype DataItems
    associatedtype TableCell: UITableViewCell, ConfigurableTableCell, ReusableView
    
    //TODO: does this need the set?
    var data: [DataItems] {get set}
    
    //Protocol extension completely cover the methods that return TableCell, so need a way to specify this
    //concretely
    var tableCellType: TableCell? { get}
    
    func numRowsSection(tableView: UITableView, _ section: Int) -> Int
    func cellAtIndexPath(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell
    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell
    
}

//TODO: Need to handle row selection as well
extension TabularData where Self.TableCell.Model == Self.DataItems {
    //TODO: right now this is presupposed 1 section. Need to assume our data is a list of lists
    //and calculate this from that.
    func numRowsSection(tableView: UITableView, _ section: Int) -> Int {
        return data.count
    }
    
    func cellAtIndexPath(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell {
        let cell = dequeueTableCell(tableView, indexPath)
        cell.configureFromModel(data[indexPath.row])
        return cell
    }
    
    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(TableCell.reuseIdentifier) as? TableCell else {
            fatalError("Could not dequeue cell with identifier: \(TableCell.reuseIdentifier)")
        }
        
        return cell
    }
}
