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
    var colorSelectionCategory: ColorCategory?
    
    
    // MARK: - Target/Action
    
    func colorButtonPressed(sender: UIButton){
        // 12 columns allign with the 12 color categories, mod the button tag by 12 to get the column #
        colorSelectionCategory = ColorCategory(rawValue: sender.tag % 12)
        colorCategoryLabel.text = colorSelectionCategory!.getStringForCategory()
        
        // change the selection view to reflect the pressed button's color
        colorSelectionLabel.backgroundColor = sender.backgroundColor
        
        // highlight the button pressed and unhighlight all others
        highlightButton(sender)
    }
    
    // only change the current selection if the confirm button is tapped
    @IBAction func confirmButtonTapped() {
        if let selectedColor = colorSelectionCategory {
            delegate?.passSelectedValue(selectedColor, color: colorSelectionLabel.backgroundColor!)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    // highlights the pressed button and unhighlights the rest
    func highlightButton(sender: UIButton) {
        // highlight the pressed button
        sender.layer.borderWidth = 3
        
        // reset all other buttons
        for button in colorButtons {
            if button.tag != sender.tag {
                button.layer.borderWidth = 0
            }
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

