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
            numberOfVarietiesLabel?.text = "# of Varities: \(viewData!.numberOfVarities!)"
            
            if let averagePrice = viewData?.averagePrice {
                averagePriceLabel?.text = "Avg price: \(averagePrice.toCurrencyFormattedString())"
            }
            else {
                fatalError("couldn't computer average price for some reason.")
            }
            
        }
    }
}

extension TotalTableViewCell: ConfigurableView {
    func configureFromModel(model: Total) {
        self.viewData = ViewData(numberOfVarities: model.numberOfVarieties, averagePrice: model.averagePrice)
    }
}

