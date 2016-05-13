//
//  RottenAppleTableVIewCell.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/12/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

class RottenAppleTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel?
    
    struct ViewData {
        var name: String?
    }
    
    var viewData: ViewData? {
        didSet {
            mainLabel?.text = viewData?.name
        }
    }
    
}

extension RottenAppleTableViewCell: ConfigurableView {
    func configureFromModel(model: Apple) {
        self.viewData = ViewData(name: model.name)
    }
}


