//
//  ValuePickerViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/29/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class ValuePickerViewController: UIViewController {
    
    // MARK: - Stored Properties
    
    var pickerView: UIPickerView!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView = UIPickerView()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    
    @IBAction func selectValue(sender: AnyObject) {
        
    }
}
