//
//  FruitTableCellFactory.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/13/16.
//  Copyright © 2016 adams. All rights reserved.
//

import UIKit

struct FruitTableCellFactory {
    //This is a plain old object not coupled to the UITableViewController lifecycle, therefore this can
    //now be unit tested. It operates on a cellDequeuer instead of UITableView, so we can make
    //any mock type we want adopt the protcol and pass it right in.
    //After all, no point in unit testing whether UIKit can dequeue cells correctly, or whether
    //I set it up correctly in the app's UI--if I didn't it *should* be obvious at runtime. Right?!
    static func createCell(cellDequeuer: CellDequeueable, apple: Apple) -> UITableViewCell {
        if apple.quality == .Rotten {
            let cell: RottenAppleTableViewCell = cellDequeuer.dequeueAndConfigureCell(apple)
            return cell
        }
        
        let cell: AppleTableViewCell = cellDequeuer.dequeueAndConfigureCell(apple)
        return cell
    }
    
    //TODO: prove this whole thing out by overloading createCell to handle a Total model object.
}

