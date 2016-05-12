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
    associatedtype TableHeaderProvider: HeaderProvider
    
    var data: [[DataItems]] {get }
    
    //Protocol extension completely cover the methods that return TableCell, so need a way to specify this
    //concretely
    var tableCellType: TableCell? { get}
    var headerProvider: TableHeaderProvider? { get}
    
    
    func numRowsSection(tableView: UITableView, _ section: Int) -> Int
    func cellAtIndexPath(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell
    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell
    
}

//TODO: Need to handle row selection as well
extension TabularData where Self.TableCell.Model == Self.DataItems {
    
    func numRowsSection(tableView: UITableView, _ section: Int) -> Int {
        return data[section].count
    }
    
    func cellAtIndexPath(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell {
        let cell = dequeueTableCell(tableView, indexPath)
        cell.configureFromModel(data[indexPath.section][indexPath.row])
        return cell
    }
    
    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> TableCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(TableCell.reuseIdentifier) as? TableCell else {
            fatalError("Could not dequeue cell with identifier: \(TableCell.reuseIdentifier)")
        }
        
        return cell
    }
    
    func titleForHeaderInSection(tableView: UITableView, _ section: Int) -> String? {
        return TableHeaderProvider(rawValue: section)?.title
    }
}
