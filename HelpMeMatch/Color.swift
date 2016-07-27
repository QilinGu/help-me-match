//
//  Color.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/16/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ColorPicker color model

// basic color model for the ColorPicker, split up into 21 color categories based on hue values
enum ColorCategory: Int {
    case ReddishViolet = 0
    case Red
    case Orange
    case Yellow
    case YellowishGreen
    case Green
    case BluishGreen
    case Cyan
    case SkyBlue
    case Blue
    case Violet
    case Pink
    case Black  // start of the neutral colors (12 - 17)
    case White
    case Gray
    case Navy
    case Brown
    case Khaki
    
    // used for neutral color buttons
    func getUIColor() -> UIColor {
        switch self {
        case .Black:
            return UIColor.blackColor()
        case .White:
            return UIColor.whiteColor()
        case .Gray:
            return UIColor.grayColor()
        case .Navy:
            return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        case .Brown:
            return UIColor.brownColor()
        case .Khaki:
            return UIColor(red: 240.0/255.0, green: 230.0/255.0, blue: 140.0/255.0, alpha: 1.0)
        default:
            return UIColor.yellowColor()
        }
    }
    
    func getStringForCategory() -> String {
        // keeping the raw value of the Category enum as an int for utility in other functions,
        // this function is used to get the label displayed to the user
        switch self {
        case .Red:
            return "red"
        case .Orange:
            return "orange"
        case .Yellow:
            return "yellow"
        case .YellowishGreen:
            return "yellowish green"
        case .Green:
            return "green"
        case .BluishGreen:
            return "bluish green"
        case .Cyan:
            return "cyan"
        case .SkyBlue:
            return "sky blue"
        case .Blue:
            return "blue"
        case .Violet:
            return "violet"
        case .Pink:
            return "pink"
        case .ReddishViolet:
            return "reddish violet"
        case .Black:
            return "black"
        case .White:
            return "white"
        case .Gray:
            return "gray"
        case .Navy:
            return "navy"
        case .Brown:
            return "brown"
        case .Khaki:
            return "khaki"
        }
    }
}


/// used to populate the default color buttons
struct DefaultColors {
    
    static var color: [ColorCategory] = [
        ColorCategory.Black,
        ColorCategory.White,
        ColorCategory.Gray,
        ColorCategory.Navy,
        ColorCategory.Brown,
        ColorCategory.Khaki
    ]
}

