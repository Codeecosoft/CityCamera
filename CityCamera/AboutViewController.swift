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
    
    
    
    @IBAction func ok() {
        DataManager.sharedInstance.about = self.aboutT.text
        dismissViewControllerAnimated(true, completion: nil)

        
    }
   
    
    
}
