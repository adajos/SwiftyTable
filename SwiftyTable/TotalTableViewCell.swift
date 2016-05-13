//
//  TotalTableViewCell.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/12/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet weak var averagePriceLabel: UILabel!
    @IBOutlet weak var numberOfVarietiesLabel: UILabel!
    
    struct ViewData {
        var numberOfVarities: Int?
        var averagePrice: Double?
    }
    
    var viewData: ViewData? {
        didSet {
            numberOfVarietiesLabel?.text = "\(viewData?.numberOfVarities)"
            
            if let averagePrice = viewData?.averagePrice {
                averagePriceLabel?.text = averagePrice.toCurrencyFormattedString()
            }
            else {
                averagePriceLabel?.text = "Unknown"
            }
            
        }
    }
}

extension TotalTableViewCell: ConfigurableTableCell {
    func configureFromModel(model: Total) {
        self.viewData = ViewData(numberOfVarities: model.numberOfVarieties, averagePrice: model.averagePrice)
    }
}

