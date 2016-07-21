//
//  CurrentSelection.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/20/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation


// MARK: - CurrentSelection

// used to store the user's current selection of items
struct CurrentSelection {
    static var currentTop: Top = defaultTop()
    static var currentBottom: Bottom = defaultBottom()
    static var currentAccessories: Accessory = defaultAccessory()
    static var currentShoes: Shoe = defaultShoe()
    
    // called when a button is pressed, checks the users outfit against criteria & offers recommendations
    func doIMatch() -> Bool {
        return false
    }
    
    // checks that the colors within an outfit match
    func checkColors() -> Bool {
        return false
    }
    
    // checks that an outfit is appropriate for the given dress code
    func checkClothingTypes() -> Bool {
        return false
    }
    
    // given the errors produced by non-matching outfits, generates advice for the user on their outfit
    func getRecommendation() -> [String] {
        return []
    }
    
    // used within the selection screen, stores the data from a user's current selection into the appropriate CurrentSelection member variable
    static func storeSelectionData(name: String, selectedCategory: ClothingCategory, categoryData: [[String : AnyObject]]) {
        // variable to store the current item's data
        var currentClothingItemData = [:]
        // have to check our array to find the correct item (would use a dictionary but I want to maintain ordering for the picker view)
        for item in categoryData {
            if item["displayName"] as! String == name {
                currentClothingItemData = item
                print("got here")
            }
        }
        // now that we have the data for the item, we change the appropriate member variable in CurrentSelection
        switch selectedCategory {
        case .Top:
            CurrentSelection.currentTop.name = currentClothingItemData["displayName"] as! String
            CurrentSelection.currentTop.isShortSleeved = currentClothingItemData["isShortSleeved"] as! Bool
            CurrentSelection.currentTop.isLongSleeved = currentClothingItemData["isLongSleeved"] as! Bool
            CurrentSelection.currentTop.isButtoned = currentClothingItemData["isButtoned"] as! Bool
            CurrentSelection.currentTop.isZippered = currentClothingItemData["isZippered"] as! Bool
            CurrentSelection.currentTop.isOuterWear = currentClothingItemData["isOuterWear"] as! Bool
            CurrentSelection.currentTop.isSportsWear = currentClothingItemData["isSportsWear"] as! Bool
            CurrentSelection.currentTop.isCasual = currentClothingItemData["isCasual"] as! Bool
            CurrentSelection.currentTop.isFormal = currentClothingItemData["isFormal"] as! Bool
        default:
            print("nothing")
        }
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












