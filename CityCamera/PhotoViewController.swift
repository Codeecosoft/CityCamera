//
//  PhotoViewController.swift
//  CityCamera
//
//  Created by Dusan Jugovic on 1/14/16.
//  Copyright © 2016 Codeeco. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let picker = UIImagePickerController()
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var back: UIBarButtonItem!
    
    @IBAction func shootPhoto(sender: UIButton){
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.Default,
            handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC,
            animated: true,
            completion: nil)
    }
    
    @IBAction func photofromLibrary(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        photoButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        uploadButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        myImageView.contentMode = UIViewContentMode.ScaleToFill
        myImageView.image = UIImage(named:"background_look_noheader")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        DataManager.sharedInstance.image = nil
        dismissViewControllerAnimated(true , completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        DataManager.sharedInstance.image = chosenImage
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewControllerWithIdentifier("PhotoDisplayView")
        picker.presentViewController(nextViewController, animated: true, completion: nil)
    }
        
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        DataManager.sharedInstance.image = nil
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func backFun() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
