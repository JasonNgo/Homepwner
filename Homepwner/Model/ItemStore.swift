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
    
    var itemsOver50 = [Item]()
    var itemsUnder50 = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        if newItem.valueInDollars > 50 {
            itemsOver50.append(newItem)
        } else {
            itemsUnder50.append(newItem)
        }
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
