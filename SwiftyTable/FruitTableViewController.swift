//
//  FruitTableViewController.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit



class FruitTableViewController: UITableViewController {
    
    var data: [[Apple]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Would normally have all apples lumped together in a single list, and slice them up into separate arrays for 
        //section division, but just hardcode it.
        
        //Business rule says Rotten apples get a different kind of cell.
        //How does this sort of design choose the appropriate kind of table cell in this case?
        let freshSection = [Apple(name: "Jonathan", price: 1.50, quality: .Fresh), Apple(name: "Cortland", price: 1.33, quality: .Fresh), Apple(name: "Macintosh", price: 1.15, quality: .Fresh)]
        let oldSection = [Apple(name: "Braeburn", price: 0.99, quality: .Old), Apple(name: "Pink Lady", price: 0.9, quality: .Old)]
        let rottenSection = [Apple(name: "Red Delicious", price: 0.25, quality: .Rotten), Apple(name:"Granny Smith", price: 0.40, quality: .Rotten)]
//        let totalSection = [Total.create(freshSection + oldSection + rottenSection)]
        data = [freshSection, oldSection, rottenSection]
    }
    
}

//MARK: UITableViewDataSource stuff
extension FruitTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //TODO: Extract this code to some kind of helper class
        let currentApple = data[indexPath.section][indexPath.row]
        if currentApple.quality == .Rotten {
            let cell: RottenAppleTableViewCell = tableView.dequeueAndConfigureCell(RottenAppleTableViewCell.self, model: currentApple)
            return cell
        }
        
        let cell: AppleTableViewCell = tableView.dequeueAndConfigureCell(AppleTableViewCell.self, model: currentApple)
        return cell
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //TODO: Since this is trivial to provide directly, do I even need the SectionTitleProvider
        //abstraction?
        return AppleQuality(rawValue: section)?.title
    }

}

