//
//  ItemStore.swift
//  Homepwner
//
//  Created by Jason Ngo on 2018-07-18.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
}
