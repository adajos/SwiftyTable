//
//  Section.swift
//  SwiftyTable
//
//  Created by Josh Adams on 5/17/16.
//  Copyright © 2016 adams. All rights reserved.
//

struct Section {
    let title: String
    let list: [CellDisplayable]
    
    init(title: String = "", list: [CellDisplayable]) {
        self.title = title
        self.list = list
    }
}

struct AnySection<T> {
    let title: String
    let list: [T]
    
    init(title: String = "", list: [T]) {
        self.title = title
        self.list = list
    }
}
