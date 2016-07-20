//
//  ValuePickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/29/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class ValuePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var selectionLabel: UILabel!
    
    
    // MARK: - Stored Properties
    
    var clothingDescriptors: NSMutableArray! = []
    var selectedCategory: ClothingCategory = ClothingCategory.Top
    var pickerSelection: [String] = []
    var currentSelection: String = ""
    
    
    // MARK: - Custom Functions
    
    func loadClothingData() {
        if let path = NSBundle.mainBundle().pathForResource("ClothingDescriptor", ofType: "plist") {
            clothingDescriptors = NSMutableArray(contentsOfFile: path)
            setupPickerSelection()
        }
    }
    
    
    // populates the current datasource of the picker view with the appropriate category
    func setupPickerSelection() {
        // get the current clothing category
        let currentCategory: [[String : AnyObject]] = clothingDescriptors[selectedCategory.rawValue] as! [[String : AnyObject]]
        // loop through each item within the category and append its display name to the list
        for item in currentCategory {
            pickerSelection.append(item["displayName"] as! String)
        }
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
        currentSelection = pickerSelection[row]
        selectionLabel.text = currentSelection
    }
    
    
    // MARK: - Target/Action
    
    // unwinds to main menu upon confirming the clothing selection
    @IBAction func confirmButtonTapped(sender: AnyObject) {
        // FIXME: Insert function to retrieve plist properties here!
        CurrentSelection.currentTop.name = currentSelection
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
        
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadClothingData()
        categoryLabel.text = selectedCategory.getString()
        pickerView.dataSource = self
        pickerView.delegate = self

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

