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
    
    @IBOutlet weak var tshirtColor: UIImageView!
    @IBOutlet weak var pantsColor: UIImageView!
    @IBOutlet weak var shoesColor: UIImageView!
    
    
    
    
    
    // MARK: - Target/Action
    
    @IBAction func doIMatchButtonTapped(sender: AnyObject) {
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier != nil {
            let clothingSelectorVC = segue.destinationViewController as! ValuePickerViewController
            // loads the appropriate category's information by setting the selectedCategory
            clothingSelectorVC.selectedCategory = ClothingCategory(rawValue: Int(segue.identifier!)!)!
                // segue identifiers correspond to the appropriate ClothingCategory's raw integer value
        }
    }
    
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    
    // MARK: - View Setup Functions
    
    // triggered when the confirm button is pressed, sets up the MainMenuView the user is returning to
    func updateView(clothingCategory category: ClothingCategory, color: UIColor) {
        // only update the category that was initially selected
        switch category {
        case ClothingCategory.Top:
            currentTop.text = CurrentSelection.currentTop.name
            currentTopColor.backgroundColor = color
            tshirtColor.tintColor = color
        case ClothingCategory.Bottom:
            currentBottoms.text = CurrentSelection.currentBottom.name
            currentBottomsColor.backgroundColor = color
            pantsColor.tintColor = color
        case ClothingCategory.Shoe:
            currentShoes.text = CurrentSelection.currentShoes.name
            currentShoesColor.backgroundColor = color
            shoesColor.tintColor = color
        case ClothingCategory.Accessory:
            print("yw")
        }
    }
    
    func setupView() {
        tshirtColor.image = UIImage(named: "shirt_colorPortion")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        pantsColor.image = UIImage(named: "pants_colorPortion")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        shoesColor.image = UIImage(named: "shoes_colorPortion")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
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
