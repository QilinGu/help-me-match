//
//  Clothing.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/18/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Structs

enum ClothingCategory: Int {
    case Top = 0
    case Bottom
    case Shoe
    case Accessory
    
    func getString() -> String {
        switch self {
        case .Top:
            return "Tops"
        case .Bottom:
            return "Bottoms"
        case .Accessory:
            return "Accessories"
        case .Shoe:
            return "Shoes"
        }
    }
}


// MARK: - Protocols

protocol Top {
    var name: String { get set }
    var color: UIColor { get set }
    var isLongSleeved: Bool { get set }
    var isShortSleeved: Bool { get set }
    var isButtoned: Bool { get set }
    var isZippered: Bool { get set }
    var isOuterWear: Bool { get set }
    var isSportsWear: Bool { get set }
    var isFormal: Bool { get set }
    var isCasual: Bool { get set }
}


protocol Bottom {
    var name: String { get set }
    var color: UIColor { get set }
    var isShorts: Bool { get set }
    var isPants: Bool { get set }
    var isJeans: Bool { get set }
    var isFormal: Bool { get set }
    var isSportsWear: Bool { get set }
}


protocol Shoe {
    var name: String { get set }
    var color: UIColor { get set }
    var isSneakers: Bool { get set }
    var isBoots: Bool { get set }
    var isSandals: Bool { get set }
    var isFormal: Bool { get set }
    var isSportsWear: Bool { get set }
    
}


protocol Accessory {
    var name: String { get set }
    var color: UIColor { get set }
    var isWatch: Bool { get set }
    var isNecklace: Bool { get set }
    var isHat: Bool { get set }
    var isFormal: Bool { get set }
    var isSportsWear: Bool { get set }
}















