//
//  ColorPickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/27/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

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
