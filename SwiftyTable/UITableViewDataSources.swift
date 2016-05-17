//
//  UITableViewControllersProtocols.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

protocol SingleCellSingleSectionTableDataSource: UITableViewDataSource {
    associatedtype ModelObject
    var items: [ModelObject] { get }
}

protocol SingleCellMultiSectionTableDataSource: UITableViewDataSource {
    associatedtype ModelObject
    var items:[AnySection<ModelObject>] { get }
}

protocol MultiCellSingleSectionTableDataSource: UITableViewDataSource {
    var items: [CellDisplayable] { get }
}

protocol MultiCellMultiSectionTableDataSource: UITableViewDataSource {
    var items: [Section] { get}
}

