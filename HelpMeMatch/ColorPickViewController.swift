//
//  ColorPickViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/26/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit



// MARK: - Protocols

protocol ColorPickerDelegate {
    var userSelectedColorCategory: ColorCategory { get set }
    var userSelectedColor: UIColor { get set }
    
    func passSelectedValue(category: ColorCategory, color: UIColor)
}

// MARK: - ColorPickerViewController

class ColorPickViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var colorCategoryLabel: UILabel!
    @IBOutlet weak var colorSelectionLabel: UIView!
    
    
    // MARK: - Stored properties
    
    var delegate: ColorPickerDelegate?
    var colorButtons: [UIButton] = []
    
    
    // MARK: - Target/Action
    
    func colorButtonPressed(sender:UIButton){
        colorSelectionLabel.backgroundColor = sender.backgroundColor
        // switch on the tag modded by 12, so we get the columns
        // the column numbers allign with the associated raw values in the ColorCategory enum
        // first reflect the selection in the ColorPicker, then send the information to its parent VC
        switch sender.tag % 12 {
        case 0:  // reddish violet
            colorCategoryLabel.text = ColorCategory(rawValue: 0)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 0)!, color: sender.backgroundColor!)
        case 1:  // red
            colorCategoryLabel.text = ColorCategory(rawValue: 1)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 1)!, color: sender.backgroundColor!)
        case 2:  // orange
            colorCategoryLabel.text = ColorCategory(rawValue: 2)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 2)!, color: sender.backgroundColor!)
        case 3:  // yellow
            colorCategoryLabel.text = ColorCategory(rawValue: 3)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 3)!, color: sender.backgroundColor!)
        case 4:  // yellowish green
            colorCategoryLabel.text = ColorCategory(rawValue: 4)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 4)!, color: sender.backgroundColor!)
        case 5:  // green
            colorCategoryLabel.text = ColorCategory(rawValue: 5)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 5)!, color: sender.backgroundColor!)
        case 6:  // bluish green
            colorCategoryLabel.text = ColorCategory(rawValue: 6)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 6)!, color: sender.backgroundColor!)
        case 7:  // cyan
            colorCategoryLabel.text = ColorCategory(rawValue: 7)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 7)!, color: sender.backgroundColor!)
        case 8:  // sky blue
            colorCategoryLabel.text = ColorCategory(rawValue: 8)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 8)!, color: sender.backgroundColor!)
        case 9:  // blue
            colorCategoryLabel.text = ColorCategory(rawValue: 9)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 9)!, color: sender.backgroundColor!)
        case 10: // violet
            colorCategoryLabel.text = ColorCategory(rawValue: 10)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 10)!, color: sender.backgroundColor!)
        case 11: // pink
            colorCategoryLabel.text = ColorCategory(rawValue: 11)!.getStringForCategory()
            delegate?.passSelectedValue(ColorCategory(rawValue: 11)!, color: sender.backgroundColor!)
        default:
            break
        }
    }
    
    
    // MARK: - Custom Functions
    
    func makeRainbowButtons(buttonFrame: CGRect, sat:CGFloat, bright:CGFloat) {
        var myButtonFrame = buttonFrame
        // populate an array of buttons
        for i in 0..<12 {
            let hue:CGFloat = CGFloat(i) / 12.0
            let color = UIColor(hue: hue, saturation: sat, brightness: bright, alpha: 1.0)
            let aButton = UIButton(frame: myButtonFrame)
            myButtonFrame.origin.x = myButtonFrame.size.width + myButtonFrame.origin.x
            aButton.backgroundColor = color
            // use an array to store all the buttons
            colorButtons.append(aButton)
            aButton.tag = colorButtons.count    // each button has a unique tag, mod this tag to check column
            view.addSubview(aButton)
            aButton.addTarget(
                self,
                action: #selector(ColorPickViewController.colorButtonPressed(_:)),
                forControlEvents: UIControlEvents.TouchUpInside)
            
        }
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the ColorPicker
        var buttonFrame = CGRect(x: 0, y: 0, width: 28, height: 28)
        var i:CGFloat = 1.0
        // populate the ColorPicker view with a 10x12 square of buttons, decrementing by 0.1 alpha per row
        while i > 0.1 {
            makeRainbowButtons(buttonFrame, sat: i ,bright: 1.0)
            i = i - 0.1
            buttonFrame.origin.y = buttonFrame.origin.y + buttonFrame.size.height
        }
    }

}

