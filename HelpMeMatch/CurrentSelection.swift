//
//  CurrentSelection.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/20/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation
import UIKit


// MARK: - CurrentSelection

// used to store the user's current selection of items
struct CurrentSelection {
    static var currentTop: Top = defaultTop()
    static var currentBottom: Bottom = defaultBottom()
    // using a dictionary to store all the current accessories, want constant lookup for checking specific accessories
    static var currentAccessories: [String : Accessory] = [:]
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
    static func storeSelectionData(name: String, selectedCategory: ClothingCategory, categoryData: [[String : AnyObject]], currentColor: UIColor) {
        // variable to store the current item's data
        var currentClothingItemData = [:]
        // have to check our array to find the correct item (would use a dictionary but I want to maintain ordering for the picker view)
        for item in categoryData {
            if item["displayName"] as! String == name {
                currentClothingItemData = item
                
                // now that we have the data for the item, we change the appropriate member variable in CurrentSelection
                switch selectedCategory {
                case .Top:
                    CurrentSelection.currentTop.name = currentClothingItemData["displayName"] as! String
                    CurrentSelection.currentTop.color = currentColor
                    CurrentSelection.currentTop.isShortSleeved = currentClothingItemData["isShortSleeved"] as! Bool
                    CurrentSelection.currentTop.isLongSleeved = currentClothingItemData["isLongSleeved"] as! Bool
                    CurrentSelection.currentTop.isButtoned = currentClothingItemData["isButtoned"] as! Bool
                    CurrentSelection.currentTop.isZippered = currentClothingItemData["isZippered"] as! Bool
                    CurrentSelection.currentTop.isOuterWear = currentClothingItemData["isOuterWear"] as! Bool
                    CurrentSelection.currentTop.isSportsWear = currentClothingItemData["isSportsWear"] as! Bool
                    CurrentSelection.currentTop.isCasual = currentClothingItemData["isCasual"] as! Bool
                    CurrentSelection.currentTop.isFormal = currentClothingItemData["isFormal"] as! Bool
                case .Bottom:
                    CurrentSelection.currentBottom.name = currentClothingItemData["displayName"] as! String
                    CurrentSelection.currentBottom.color = currentColor
                    CurrentSelection.currentBottom.isShorts = currentClothingItemData["isShorts"] as! Bool
                    CurrentSelection.currentBottom.isPants = currentClothingItemData["isPants"] as! Bool
                    CurrentSelection.currentBottom.isJeans = currentClothingItemData["isJeans"] as! Bool
                    CurrentSelection.currentBottom.isFormal = currentClothingItemData["isFormal"] as! Bool
                    CurrentSelection.currentBottom.isSportsWear = currentClothingItemData["isSportsWear"] as! Bool
                case .Shoe:
                    CurrentSelection.currentShoes.name = currentClothingItemData["displayName"] as! String
                    CurrentSelection.currentShoes.color = currentColor
                    CurrentSelection.currentShoes.isSneakers = currentClothingItemData["isSneakers"] as! Bool
                    CurrentSelection.currentShoes.isBoots = currentClothingItemData["isBoots"] as! Bool
                    CurrentSelection.currentShoes.isSandals = currentClothingItemData["isSandals"] as! Bool
                    CurrentSelection.currentShoes.isFormal = currentClothingItemData["isFormal"] as! Bool
                    CurrentSelection.currentShoes.isSportsWear = currentClothingItemData["isSportsWear"] as! Bool
                case .Accessory:
                    // unlike the other categories, that can't have more than one item, a user can have multiple accessories.
                    // to accomodate this, create an instance of an accessory item and add to the dictionary
                    var currentAccessoryItem: Accessory = defaultAccessory()
                    currentAccessoryItem.name = currentClothingItemData["displayName"] as! String
                    currentAccessoryItem.isWatch = currentClothingItemData["isWatch"] as! Bool
                    currentAccessoryItem.isNecklace = currentClothingItemData["isNecklace"] as! Bool
                    currentAccessoryItem.isHat = currentClothingItemData["isHat"] as! Bool
                    currentAccessoryItem.isFormal = currentClothingItemData["isFormal"] as! Bool
                    currentAccessoryItem.isSportsWear = currentClothingItemData["isSportsWear"] as! Bool
            
                    currentAccessories[name] = currentAccessoryItem
                }
            }
        }
    }
    
}


// MARK: - Default Values

struct defaultTop: Top {
    var name: String = "T-shirt"
    var color: UIColor = UIColor.grayColor()
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
    var name: String = "Shorts"
    var color: UIColor = UIColor.grayColor()
    var isShorts: Bool = true
    var isPants: Bool = false
    var isJeans: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}

struct defaultShoe: Shoe {
    var name: String = "Casual sneakers"
    var color: UIColor = UIColor.grayColor()
    var isSneakers: Bool = true
    var isBoots: Bool = false
    var isSandals: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}

struct defaultAccessory: Accessory {
    var name: String = "casualwatch"
    var color: UIColor = UIColor.grayColor()
    var isWatch: Bool = true
    var isNecklace: Bool = false
    var isHat: Bool = false
    var isFormal: Bool = false
    var isSportsWear: Bool = false
}












