//
//  CameraViewController.swift
//  StreetPerformers
//
//  Created by Emma Sloan on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var retakeButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var stars: StarsView!
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    let picker = UIImagePickerController()
    var displayBool = false
    var uploading = false
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self

    }
    override func viewDidDisappear(animated: Bool) {
        displayBool = false
    }
    override func viewDidAppear(animated: Bool) {
        if(!displayBool){
        picker.allowsEditing = false
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]){
            displayBool = true
            let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            dismissViewControllerAnimated(true, completion: nil)
            self.imageV.image = chosenImage
            self.cameraButton.hidden = true
            self.stars.hidden = false
            self.continueButton.hidden = false
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        displayBool = true
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func donePressed(){
        if(!self.stars.hidden){
            self.stars.hidden = true
            self.commentTextField.hidden = false
            self.commentTextField.becomeFirstResponder()
        }else{
            if(!uploading){
            self.uploading = true
            let upload = Upload(desc: self.commentTextField.text!, img: self.imageV.image, rating: self.stars.starValue, category: "Dancers")
            upload.uploadParseBackground({ () -> () in
                dispatch_async(dispatch_get_main_queue()){
                    self.imageV.image = nil
                    self.stars.hidden = true
                    self.commentTextField.hidden = true
                    self.cameraButton.hidden = false
                    self.continueButton.hidden = true
                    let alertView = UIAlertView(title: "Feeling your Vibe!", message: "", delegate: self, cancelButtonTitle: "Cool!")
                    alertView.alertViewStyle = .Default
                    alertView.show()
                    self.uploading = false

                }
                }, onFailure: { () -> () in
                    let alertView = UIAlertView(title: "Unable to reach server", message: "", delegate: self, cancelButtonTitle: "Aw man...")
                    alertView.alertViewStyle = .Default
                    alertView.show()
                    self.uploading = false

                print("failure")
            })
            }
        }
    }
}
