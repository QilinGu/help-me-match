//
//  Color.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/16/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation
import UIKit

// Basic model for the color categories, split up into 21 colors based on hue values
enum Category: Int {
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
        }
    }
}


// Helper class for dealing with selected colors, x-coordinate must be relative to the ColorPicker view.
class ColorHelper {
    // helper class that returns a Color
    class func getColorCategory(x: CGFloat, colorSelectorWidth: CGFloat) -> String {
        let colorSegmentWidth: CGFloat = colorSelectorWidth / 21.0
        
        if (0.0 <= x && x < (0.5 * colorSegmentWidth)) {
            return "red"
        }
        
        if ((colorSelectorWidth - (0.5 * colorSegmentWidth) <= x && x < colorSegmentWidth)) {
            return "red"
        }
        
        for i in 0...19 {
            // ColorPicker was split up weird 
            // | 1/2 R | 1 G | 1 B | 1/2 R |
            // so to compensate its shifted half a segment
            if ((CGFloat(i) * colorSegmentWidth) <= x && x < ((CGFloat(i + 1) * colorSegmentWidth) + (0.5 * colorSegmentWidth))) {
                return (Category(rawValue: i + 1)?.getStringForCategory())!
            }
        }

        return "red"
    }
    
}














