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
    
    
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
        DataManager.sharedInstance.about = nil
    }
    
    @IBAction func ok() {
        DataManager.sharedInstance.about = self.aboutT.text
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
