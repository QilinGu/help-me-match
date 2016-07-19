//
//  MainMenuViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/18/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier != nil {
            
            if segue.identifier == "topSegue" {
                let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
                clothingSelectorVC.selectedCategory = ClothingCategory.Top
            }
            if segue.identifier == "bottomSegue" {
                let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
                clothingSelectorVC.selectedCategory = ClothingCategory.Bottom
            }
            if segue.identifier == "accessorySegue" {
                let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
                clothingSelectorVC.selectedCategory = ClothingCategory.Accessory
            }
            if segue.identifier == "shoeSegue" {
                let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
                clothingSelectorVC.selectedCategory = ClothingCategory.Shoe
            }
        }
    }
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}

}
