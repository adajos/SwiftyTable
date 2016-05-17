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

enum AppleSectionTitleProvider: Int, SectionTitleProvider {
    case Fresh
    case Old
    case Rotten
    case Total
    
    var title: String {
        switch self {
        case .Fresh: return AppleQuality.Fresh.title
        case .Old: return AppleQuality.Old.title
        case .Rotten: return AppleQuality.Rotten.title
        case .Total: return "Total"
        }
    }
}








