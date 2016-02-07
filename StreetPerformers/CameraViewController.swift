//
//  CameraViewController.swift
//  StreetPerformers
//
//  Created by Emma Sloan on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate , UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var retakeButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var stars: StarsView!
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    let picker = UIImagePickerController()
    @IBOutlet var scroller: UIPickerView!
    var displayBool = false
    var uploading = false
    let pickerData = ["Dance", "Vocals", "Instruments", "Make-Up", "Stunts"]

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
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func loadImageButtonTapped(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func donePressed(){
        if(!self.stars.hidden){
            self.stars.hidden = true
            self.commentTextField.hidden = false
            scroller.selectRow(0, inComponent: 0, animated: false)
            self.scroller.hidden = false
            self.commentTextField.becomeFirstResponder()
            
        }else{
            if(!uploading){
            self.uploading = true
            let upload = Upload(desc: self.commentTextField.text!, img: self.imageV.image, rating: self.stars.starValue,
                category: self.pickerView(scroller, titleForRow: scroller.selectedRowInComponent(0), forComponent: 0)!)
            upload.uploadParseBackground({ () -> () in
                dispatch_async(dispatch_get_main_queue()){
                    self.imageV.image = nil
                    self.stars.hidden = true
                    self.commentTextField.hidden = true
                    self.cameraButton.hidden = false
                    self.continueButton.hidden = true
                    self.scroller.hidden = true
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
