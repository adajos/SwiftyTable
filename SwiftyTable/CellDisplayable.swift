//
//  CellDisplayable.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

public protocol CellDisplayable {
    func getCell(cellDequeuer: CellDequeueable) -> UITableViewCell
}
