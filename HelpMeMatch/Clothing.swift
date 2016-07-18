//
//  Clothing.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/18/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation


// MARK: - Clothing Categories

enum ClothingCategory: Int {
    case Top = 0
    case Bottom
    case Shoe
    case Accessory
}
// MARK: - Protocols

protocol Top {
    var isLongSleeved: Bool { get }
    var isShortSleeved: Bool { get }
    var isButtoned: Bool { get }
    var isZippered: Bool { get }
    var isOuterWear: Bool { get }
    var isSportsWear: Bool { get }
    var isFormal: Bool { get }
    var isCasual: Bool { get }
}


protocol Bottom {
    var isShorts: Bool { get }
    var isPants: Bool { get }
    var isJeans: Bool { get }
    var isFormal: Bool { get }
    var isSportsWear: Bool { get }
}


protocol Shoe {
    var isSneakers: Bool { get }
    var isBoots: Bool { get }
    var isSandals: Bool { get }
    var isFormal: Bool { get }
    var isSportsWear: Bool { get }
    
}


protocol Accessory {
    var isWatch: Bool { get }
    var isNecklace: Bool { get }
    var isHat: Bool { get }
    var isFormal: Bool { get }
    var isSportsWear: Bool { get }
}















