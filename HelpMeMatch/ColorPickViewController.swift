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
    
    // MARK: - Stored properties
    
    var delegate: ColorPickerDelegate?
    
    
    // MARK: - Target/Action
    
    func colorButtonPressed(sender:UIButton){
        
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
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blackColor()
        
        var buttonFrame = CGRect(x: 12, y: 100, width: 25, height: 25)
        var i:CGFloat = 1.0
        // populate the ColorPicker view with a 10x12 square of buttons, decrementing by 0.1 alpha per row
        while i > 0{
            makeRainbowButtons(buttonFrame, sat: i ,bright: 1.0)
            i = i - 0.1
            buttonFrame.origin.y = buttonFrame.origin.y + buttonFrame.size.height
        }
    }

    
}

