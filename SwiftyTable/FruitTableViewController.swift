//
//  FruitTableViewController.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit



class FruitTableViewController: UITableViewController {
    //Only need to mess around with an Array of CellDisplayables if we have multiple kinds of cells that we will use
    //in this table. Otherwise can just use the concrete model object.
    var items: [[CellDisplayable]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Would normally have all apples lumped together in a single list, and slice them up into separate arrays for 
        //section division, but just hardcode it.
        
        //Business rule says Rotten apples get a different kind of cell.
        let freshSection: [CellDisplayable] = [Apple(name: "Jonathan", price: 1.50, quality: .Fresh), Apple(name: "Cortland", price: 1.33, quality: .Fresh), Apple(name: "Macintosh", price: 1.15, quality: .Fresh)]
        let oldSection: [CellDisplayable] = [Apple(name: "Braeburn", price: 0.99, quality: .Old), Apple(name: "Pink Lady", price: 0.9, quality: .Old)]
        let rottenSection: [CellDisplayable] = [Apple(name: "Red Delicious", price: 0.25, quality: .Rotten), Apple(name:"Granny Smith", price: 0.40, quality: .Rotten)]
        
        let applesArray: [Apple] = (freshSection + oldSection + rottenSection).flatMap {$0 as? Apple}
        let theTotal = Total.create(applesArray)

        items = [freshSection, oldSection, rottenSection, [theTotal]]
    }
    
}

//MARK: UITableViewDataSource stuff
extension FruitTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       return items[indexPath.section][indexPath.row].getCell(tableView)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AppleSectionTitleProvider(rawValue: section)?.title
    }

}


