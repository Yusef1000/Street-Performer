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
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    func imagePickerController(
        picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]){}
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {}
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    }
    

}
