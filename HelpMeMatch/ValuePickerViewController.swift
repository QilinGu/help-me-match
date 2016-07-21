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
    
    var categoryData: [[String : AnyObject]] = [[:]]
    var selectedCategory: ClothingCategory = ClothingCategory.Top
    var pickerSelection: [String] = []
    var userSelection: String = ""
    
    
    // MARK: - Custom Functions
    
    func loadClothingData() {
        if let path = NSBundle.mainBundle().pathForResource("ClothingDescriptor", ofType: "plist") {
            let clothingDescriptors = NSMutableArray(contentsOfFile: path)
            categoryData = clothingDescriptors![selectedCategory.rawValue] as! [[String : AnyObject]]
            setupPickerSelection()
        }
    }
    
    
    // populates the current datasource of the picker view with the appropriate category
    func setupPickerSelection() {
        // loop through each item within the category and append its display name to the list
        for item in categoryData {
            pickerSelection.append(item["displayName"] as! String)
        }
    }
    
    
    // sets up the view based on the current category selection
    func setupView() {
        categoryLabel.text = selectedCategory.getString()
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
    
    
    // MARK: - Target/Action
    
    // unwinds to main menu upon confirming the clothing selection
    @IBAction func confirmButtonTapped(sender: AnyObject) {
        // FIXME: Insert function to retrieve plist properties here!
        CurrentSelection.storeSelectionData(userSelection, selectedCategory: selectedCategory, categoryData: categoryData)
        print(CurrentSelection.currentTop.name)
        print(CurrentSelection.currentTop.isFormal)
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
        
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadClothingData()
        setupView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

