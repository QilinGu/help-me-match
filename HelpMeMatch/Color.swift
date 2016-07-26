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
    case Red = 0
    case OrangeRed
    case Orange
    case OrangeYellow
    case Yellow
    case GreenishYellow
    case YellowishGreen
    case Green
    case BluishGreen
    case GreenishBlue
    case Cyan
    case LightBlue
    case SkyBlue
    case Blue
    case DarkBlue
    case PurplishBlue
    case BluishPurple
    case Purple
    case PinkishPurple
    case Pink
    case ReddishPink
    case PinkishRed
    // neutral colors range from 22-27
    case Black = 22
    case White = 23
    case Gray = 24
    case Navy = 25
    case Brown = 26
    case Khaki = 27
    
    // used for neutral colors
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
        case .OrangeRed :
            return "orange red"
        case .Orange:
            return "orange"
        case .OrangeYellow:
            return "orange yellow"
        case .Yellow:
            return "yellow"
        case .GreenishYellow:
            return "greenish yellow"
        case .YellowishGreen:
            return "yellowish green"
        case .Green:
            return "green"
        case .BluishGreen:
            return "bluish green"
        case .GreenishBlue:
            return "greenish blue"
        case .Cyan:
            return "cyan"
        case .LightBlue:
            return "light blue"
        case .SkyBlue:
            return "sky blue"
        case .Blue:
            return "blue"
        case .DarkBlue:
            return "dark blue"
        case .PurplishBlue:
            return "purplish blue"
        case .BluishPurple:
            return "bluish purple"
        case .Purple:
            return "purple"
        case .PinkishPurple:
            return "pinkish purple"
        case .Pink:
            return "pink"
        case .ReddishPink:
            return "reddish pink"
        case .PinkishRed:
            return "pinkish red"
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


// MARK: - Helper Class

// helper class for dealing with user-selected colors
// x-coordinate provided must be relative to the ColorPicker view
class ColorHelper {
    // helper function that returns a category name for a provided location on the ColorPicker
    class func getColorCategory(x: CGFloat, colorSelectorWidth: CGFloat) -> ColorCategory {
        let colorSegmentWidth: CGFloat = colorSelectorWidth / 22.0
        
        if (0.0 <= x && x < (0.5 * colorSegmentWidth)) {
            return ColorCategory.Red
        }
        
        if ((colorSelectorWidth - (0.5 * colorSegmentWidth) <= x && x < colorSegmentWidth)) {
            return ColorCategory.Red
        }
        
        for i in 0...20 {
            // ColorPicker was split up weird 
            // | 1/2 R | 1 G | 1 B | 1/2 R |
            // so to compensate its shifted half a segment
            if ((CGFloat(i) * colorSegmentWidth) <= x && x < ((CGFloat(i + 1) * colorSegmentWidth) + (0.5 * colorSegmentWidth))) {
                return ColorCategory(rawValue: i + 1)!
            }
        }

        return ColorCategory.Red
    }
    
}














