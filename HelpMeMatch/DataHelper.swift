//
//  DataHelper.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/21/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation

class DataHelper {
    
    // returns the plist information for the passed category
    class func loadClothingData(selectedCategory: ClothingCategory) -> [[String : AnyObject]] {
        if let path = NSBundle.mainBundle().pathForResource("ClothingDescriptor", ofType: "plist") {
            let clothingDescriptors = NSMutableArray(contentsOfFile: path)
            return clothingDescriptors![selectedCategory.rawValue] as! [[String : AnyObject]]
        }
        return [[:]]
    }
}
