//
//  PhotoDisplayViewController.swift
//  CityCamera
//
//  Created by Dusan Jugovic on 1/22/16.
//  Copyright © 2016 Codeeco. All rights reserved.
//

import UIKit

class PhotoDisplayViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = DataManager.sharedInstance.image
    }
    
    @IBAction func cancel() {
        DataManager.sharedInstance.image = nil
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewControllerWithIdentifier("PhotoViewController")
        self.presentViewController(nextViewController, animated: true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
