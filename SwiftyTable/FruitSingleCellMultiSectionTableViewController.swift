//
//  FruitSingleCellMultiSectionTableViewController.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

class FruitSingleCellMultiSectionTableViewController: UITableViewController, SingleCellMultiSectionTableDataSource {
    
    var items:[AnySection<Apple>] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let freshSection = AnySection(title: AppleQuality.Fresh.title, list:[Apple(name: "Jonathan", price: 1.50, quality: .Fresh), Apple(name: "Cortland", price: 1.33, quality: .Fresh), Apple(name: "Macintosh", price: 1.15, quality: .Fresh)])
        
        let oldSection = AnySection(title: AppleQuality.Old.title, list:[Apple(name: "Braeburn", price: 0.99, quality: .Old), Apple(name: "Pink Lady", price: 0.9, quality: .Old)])
        
        let rottenSection = AnySection(title: AppleQuality.Rotten.title, list:[Apple(name: "Red Delicious", price: 0.25, quality: .Rotten), Apple(name:"Granny Smith", price: 0.40, quality: .Rotten)])
        
        items = [freshSection, oldSection, rottenSection]
    }
}

//MARK: UITableViewDataSource stuff
extension FruitSingleCellMultiSectionTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //could use Apple's CellDisplayable conformance to do this (just like in MultiCellMultiSection):
        //return items[indexPath.section].list[indexPath.row].getCell(tableView)
        //But maybe Apples are only rendered in single cell table views so we don't mess around with 
        //CellDisplayable at all. 
        let cell: AppleTableViewCell = tableView.dequeueAndConfigureCell(items[indexPath.section].list[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].title
    }
}
