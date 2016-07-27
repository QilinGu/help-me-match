//
//  ColorPickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/27/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//
/*
import UIKit

class ColorPickerViewController: UIViewController, HSBColorPickerDelegate {
    
    //MARK: - Stored Properties
    
    // created a DataSource protocol so I could pass data back over to the selector view controller via the passSelectedValue() function
    var datasource: HSBColorPickerDataSource?
    var selectorColor: ColorCategory?
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var currentColor: UIView!    
    @IBOutlet weak var colorPicker: HSBColorPicker!
    @IBOutlet weak var colorLabel: UILabel!
    
    
    // MARK: - HSBColorPickerDelegate Functions
    
    // Attached to the small selection, changes its color to the user selection
    func HSBColorColorPickerTouched(sender: HSBColorPicker, color: UIColor, point: CGPoint, state: UIGestureRecognizerState) {
        currentColor.backgroundColor = color
        selectorColor = ColorHelper.getColorCategory(point.x, colorSelectorWidth: colorPicker.bounds.width)
        colorLabel.text = selectorColor?.getStringForCategory()
        datasource?.passSelectedValue(selectorColor!, color: color)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
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

*/



