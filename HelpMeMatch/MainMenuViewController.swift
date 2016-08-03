//
//  MainMenuViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 7/18/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: - IBOutets
    
    // clothing labels
    @IBOutlet weak var currentTop: UILabel!
    @IBOutlet weak var currentBottoms: UILabel!
    @IBOutlet weak var currentShoes: UILabel!
    @IBOutlet weak var currentAccessories: UILabel!
    
    // color labels
    @IBOutlet weak var currentTopColor: UIView!
    @IBOutlet weak var currentBottomsColor: UIView!
    @IBOutlet weak var currentShoesColor: UIView!
    @IBOutlet weak var currentAccessoriesColor: UIView!
    
    // clothing image views
    @IBOutlet weak var tshirtImage: UIImageView!
    @IBOutlet weak var pantsImage: UIImageView!
    @IBOutlet weak var shoeImage1: UIImageView!
    @IBOutlet weak var shoeImage2: UIImageView!
    
    
    
    
    // MARK: - Target/Action
    
    @IBAction func doIMatchButtonTapped(sender: AnyObject) {
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier != nil {
            let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
            // set the delegate to this view controller
            clothingSelectorVC.delegate = self
            // loads the appropriate category's information by setting the selectedCategory
            clothingSelectorVC.selectedCategory = ClothingCategory(rawValue: Int(segue.identifier!)!)!
                // segue identifiers correspond to the appropriate ClothingCategory's raw integer value
        }
    }
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    
    // MARK: - View Setup Functions
    
    func updateView() {
        
    }
    
    func setupView() {
        tshirtImage.image = UIImage(named: "tshirt")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    }
    
    func setupImageView( ) {}
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // image setup
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
