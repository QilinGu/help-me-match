//
//  ViewController.swift
//  HelpMeMatch
//
//  Created by Andrew Roberts on 6/27/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class ColorButtonViewController: UIViewController, UIPopoverPresentationControllerDelegate {
 
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UIPopoverPresentationControllerDelegate Functions
    
    @IBAction func showPopover(sender: AnyObject) {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView" {
            let vc = segue.destinationViewController
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
}

