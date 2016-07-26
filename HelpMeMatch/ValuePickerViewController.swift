//
//  ValuePickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/29/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class ValuePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,
    UIPopoverPresentationControllerDelegate, HSBColorPickerDataSource {
    
    // MARK: - IBOutlets
    // labels
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var currentColor: UIView!
    // array of the color buttons
    @IBOutlet var colorButtons: [UIButton]!
    
    
    // MARK: - Stored Properties
    
    var categoryData: [[String : AnyObject]] = [[:]]
    var selectedCategory: ClothingCategory = ClothingCategory.Top
    var pickerSelection: [String] = []
    var userSelection: String = ""
    var userSelectedColor: ColorCategory = ColorCategory.Black
    // color for selection box may not line up with the category exactly, doesn't matter for the backend
    var colorForSelectionBox: UIColor = UIColor.blackColor()
    
 
    
    // MARK: - Custom Functions
    
    // populates the current datasource of the picker view with the appropriate category data
    func setupPickerSelection() {
        // loop through each item within the category and append its display name to the list
        for item in categoryData {
            pickerSelection.append(item["displayName"] as! String)
        }
    }
    
    // populates the buttons on the selection view
    func setupDefaultColors() {
        var i = 0
        // loop through the buttons and set their background colors appropriately
        // i is based off their order in the array
        for button in colorButtons {
            button.backgroundColor = DefaultColors.color[i].getUIColor()
            i += 1
        }
    }
 
    // sets up the view based on the current category selection
    func setupView() {
        setupPickerSelection()
        categoryLabel.text = selectedCategory.getString()
        setupDefaultColors() 
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    
    // MARK: - UIPickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerSelection.count
    }
    
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerSelection[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelection = pickerSelection[row]
        selectionLabel.text = userSelection
    }
    
    
    // MARK: - HSBColorPickerDataSource Functions
    
    func passSelectedValue(category: ColorCategory, color: UIColor) {
        userSelectedColor = category
        currentColor.backgroundColor = color
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate Functions
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    // MARK: - Target/Action
    
    // unwinds to main menu upon confirming the clothing selection
    @IBAction func confirmButtonTapped(sender: AnyObject) {
        CurrentSelection.storeSelectionData(userSelection, selectedCategory: selectedCategory,
                                            categoryData: categoryData, currentColor: currentColor.backgroundColor!)
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
        
    }
    
    
    @IBAction func neutralColorTapped(sender: UIButton) {
        // each button's tag is set to the appropriate raw integer value of its ColorCategory representation
        // after setting the userSelectedColor saved attribute, reflect the user selection on the bottom view
        userSelectedColor = ColorCategory(rawValue: sender.tag)!
        currentColor.backgroundColor = sender.backgroundColor
        
        // turn highlighted status of the selected button on, all other buttons off
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor.yellowColor().CGColor
        
        for button in colorButtons {
            if button.tag != sender.tag {
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.blackColor().CGColor
            }
        }        
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier != nil {
            
            if segue.identifier == "unwindToMenu" {
                let mainMenuVC = segue.destinationViewController as! MainMenuViewController
                
                // only update the label that was pressed
                switch selectedCategory {
                case ClothingCategory.Top:
                    mainMenuVC.currentTop.text = CurrentSelection.currentTop.name
                    mainMenuVC.currentTopColor.backgroundColor = CurrentSelection.currentTop.color
                case ClothingCategory.Bottom:
                    mainMenuVC.currentBottoms.text = CurrentSelection.currentBottom.name
                    mainMenuVC.currentBottomsColor.backgroundColor = CurrentSelection.currentBottom.color
                case ClothingCategory.Shoe:
                    mainMenuVC.currentShoes.text = CurrentSelection.currentShoes.name
                    mainMenuVC.currentShoesColor.backgroundColor = CurrentSelection.currentShoes.color
                case ClothingCategory.Accessory:
                    if let accessory = CurrentSelection.currentAccessories["Dress Watch"]?.name {
                        mainMenuVC.currentAccessories.text = accessory
                    }
                }
            }
            
            if segue.identifier == "showColorPicker" {
                let vc = segue.destinationViewController as! ColorPickerViewController
                // SET THE DATASOURCE TO THIS VIEW CONTROLLER TO ENABLE USE OF FUNCTION TO PASS DATA!!
                vc.datasource = self
                let controller = vc.popoverPresentationController
                if controller != nil {
                    controller?.delegate = self
                }
            }
        }
        
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryData = DataHelper.loadClothingData(selectedCategory)
        setupView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

