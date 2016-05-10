//
//  FruitTableViewController.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

enum AppleSection : Int {
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


class FruitTableViewController: UITableViewController {
    
    var data: [[Apple]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var tableCellType: AppleTableViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let freshSection = [Apple(name: "Jonathan", price: 1.50), Apple(name: "Cortland", price: 1.33), Apple(name: "Macintosh", price: 1.15)]
        let oldSection = [Apple(name: "Braeburn", price: 0.99), Apple(name: "Pink Lady", price: 0.9)]
        let rottenSection = [Apple(name: "Red Delicious", price: 0.25), Apple(name:"Granny Smith", price: 0.40)]
        data = [freshSection, oldSection, rottenSection]
    }
    
}

extension FruitTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
}

extension FruitTableViewController: TabularData {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRowsSection(tableView, section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellAtIndexPath(tableView, indexPath)
    }
    //TODO: can I push this down into tabular data extension by making AppleSection adopt a TableSectionTitleProviderProtocol?
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AppleSection(rawValue: section)?.title
    }
    
//    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> AppleTableViewCell {
//       return tableView.dequeueReusableCellWithIdentifier("Cell") as! AppleTableViewCell
//    }
    
    
}
