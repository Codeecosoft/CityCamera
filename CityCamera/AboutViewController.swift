//
//  AboutViewController.swift
//  CityCamera
//
//  Created by Bojan Filipovic on 1/23/16.
//  Copyright © 2016 Codeeco. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutT: UITextView!
    
    override func viewDidLoad() {
        aboutT.becomeFirstResponder()
        super.viewDidLoad()
    }
    
    @IBAction func ok() {
        DataManager.sharedInstance.about = self.aboutT.text
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    @IBAction func cancel() {
        DataManager.sharedInstance.about = self.aboutT.text
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
   
    
    
}
