//
//  AppleTableViewCell.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/10/16.
//  Copyright © 2016 adams. All rights reserved.
//

import Foundation
import UIKit

class AppleTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    
    var viewData: ViewData? {
        didSet {
            mainLabel?.text = viewData?.name
            
            if let price = viewData?.price {
                priceLabel?.text = price.toCurrencyFormattedString()
            }
            else {
                priceLabel?.text = "Unknown"
            }
            
            
        }
    }
    
    
    struct ViewData {
        var name: String?
        var price: Double?
    }
}

extension AppleTableViewCell: ConfigurableTableCell {
    func configureFromModel(model: Apple) {
        self.viewData = ViewData(name: model.name, price: model.price)
    }
}

extension AppleTableViewCell: ReusableView {}
