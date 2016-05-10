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
    
    static var numberOfSections: Int {
        return 3
    }
}

//TODO: should this be put more in the "framework" code?
struct Section<Item> {
    let title: String
    let items: [Item]
}

class FruitTableViewController: UITableViewController {
    var data: [Apple] = [] {
        didSet {
            tableView.reloadData()
        }
        
    }
    
    var tableCellType: AppleTableViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [Apple(name: "Jonathan", price: 1.50), Apple(name: "Cortland", price: 1.33), Apple(name: "Macintosh", price: 1.15)]
    }
    
}

extension FruitTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

extension FruitTableViewController: TabularData {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRowsSection(tableView, section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellAtIndexPath(tableView, indexPath)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header"
    }
    
//    func dequeueTableCell(tableView: UITableView, _ indexPath: NSIndexPath) -> AppleTableViewCell {
//       return tableView.dequeueReusableCellWithIdentifier("Cell") as! AppleTableViewCell
//    }
    
    
}
