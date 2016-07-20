//
//  CurrentSelection.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/20/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation

// Used to store the user's current selection of items.  Functions check

struct CurrentSelection {
    static var currentTop: Top = defaultTop()
    static var currentBottom: Bottom = defaultBottom()
    static var currentAccessories: Accessory = defaultAccessory()
    static var currentShoes: Shoe = defaultShoe()
    
    func doIMatch() -> Bool {
        return false
    }
    
    func checkColors() -> Bool {
        return false
    }
    
    func checkClothingTypes() -> Bool {
        return false
    }
    
    func getRecommendation() -> [String] {
        return []
    }
    
}


// MARK: - Default Values

struct defaultTop: Top {
    var name: String = "tshirt"
    var isLongSleeved: Bool = false
    var isShortSleeved: Bool = true
    var isButtoned: Bool = false
    var isZippered: Bool = false
    var isOuterWear: Bool = false
    var isSportsWear: Bool = false
    var isFormal: Bool = false
    var isCasual: Bool = false
}

struct defaultBottom: Bottom {
    var name: String = "shorts"
    var isShorts: Bool = true
    var isPants: Bool = false
    var isJeans: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}

struct defaultShoe: Shoe {
    var name: String = "sneakers"
    var isSneakers: Bool = true
    var isBoots: Bool = false
    var isSandals: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}

struct defaultAccessory: Accessory {
    var name: String = "casualwatch"
    var isWatch: Bool = true
    var isNecklace: Bool = false
    var isHat: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}












