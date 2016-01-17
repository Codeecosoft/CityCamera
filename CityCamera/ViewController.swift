//
//  ViewController.swift
//  CityCamera
//
//  Created by Dusan Jugovic on 1/11/16.
//  Copyright © 2016 Codeeco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonPhoto : UIButton!
    @IBOutlet weak var buttonLocation : UIButton!
    @IBOutlet weak var buttonSend : UIButton!
    @IBOutlet weak var buttonAbout : UIButton!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleButtons();
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scaleButtons() {
        buttonPhoto.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonLocation.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonSend.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonAbout.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    @IBAction func camTest() {
        
    }
}

