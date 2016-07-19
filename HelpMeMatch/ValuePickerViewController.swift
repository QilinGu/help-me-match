//
//  ValuePickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/29/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

/*class ValuePickerViewController: UIViewController {
    
    // MARK: - IBOutlets 
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    // MARK: - Stored Properties
    
    var clothingDescriptors: NSMutableArray!
    var selectedCategory: ClothingCategory
    var pickerSelection: [String] = []
    
    
    // MARK: - Custom Functions
    
    func loadClothingDescriptors() {
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UIPickerViewDataSource Functions
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    }

    
    // MARK: - Target/Action
    
    @IBAction func selectValue(sender: AnyObject) {
        
    }
 
}
 */
