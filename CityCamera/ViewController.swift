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
    @IBOutlet weak var buttonCenter : UIButton!
    @IBOutlet weak var logoImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleButtons();
        buttonCenter.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        
        //TODO make auto width instead of 1000
        let lineView = UIView(frame: CGRectMake(0, 0, 1000, 1))
        lineView.backgroundColor=UIColor.blackColor()
        logoImageView.addSubview(lineView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
    
    @IBAction func sendData() {
        
        let request = NSMutableURLRequest(URL: NSURL(string: getURL())!)
        request.HTTPMethod = "POST"
        let postString = getPostString()
        //TODO konkatenacija svih parametara odvojenih sa &
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    func getURL() -> String {
        let sbUrl = "http://www.hyperether.com/Mobile/androidWPScript.php?"
        return sbUrl
    }
    
    func getPostString() -> String {
        var sbUrl = ""
        sbUrl+="pN=TESTNOIMAGE&";
        sbUrl+="IMEI=0&";
        sbUrl+="sU=noname&";
        sbUrl+="pC=&";
        sbUrl+="cS=murija&";
        sbUrl+="lO=0&";
        sbUrl+="lA=0&";
        sbUrl+="aD=noadress";
        
        return sbUrl
    }
}

