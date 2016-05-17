//
//  ModelExtensions.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

extension Apple: CellDisplayable {
    func getCell(cellDequeuer: CellDequeueable) -> UITableViewCell {
        if self.quality == .Rotten {
            let cell: RottenAppleTableViewCell = cellDequeuer.dequeueAndConfigureCell(self)
            return cell
        }
        
        let cell: AppleTableViewCell = cellDequeuer.dequeueAndConfigureCell(self)
        return cell
    }
}

extension Total: CellDisplayable {
    func getCell(cellDequeuer: CellDequeueable) -> UITableViewCell {
        let cell: TotalTableViewCell = cellDequeuer.dequeueAndConfigureCell(self)
        return cell
    }
}
