//
//  FruitMultiCellSingleSectionTableViewController.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

class FruitMultiCellSingleSectionTableViewController: UITableViewController, MultiCellSingleSectionTableDataSource {
    
    var items: [CellDisplayable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [Apple(name: "Jonathan", price: 1.50, quality: .Fresh),
                 Apple(name: "Cortland", price: 1.33, quality: .Fresh),
                 Apple(name: "Macintosh", price: 1.15, quality: .Fresh),
                 Apple(name: "Braeburn", price: 0.99, quality: .Old),
                 Apple(name: "Pink Lady", price: 0.9, quality: .Old),
                 Apple(name: "Red Delicious", price: 0.25, quality: .Rotten),
                 Apple(name:"Granny Smith", price: 0.40, quality: .Rotten)]
    }
}

//MARK: UITableViewDataSource stuff
extension FruitMultiCellSingleSectionTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //defer to the CellDisplayable to dequeue and configure the cell single we have multiple types
        //of cells.
        return items[indexPath.row].getCell(tableView)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Apples"
    }
}
