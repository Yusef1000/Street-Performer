//
//  SignUpViewController.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit
import ParseFacebookUtilsV4
class SignUpViewController: UIViewController{
    override func viewDidLoad() {
        
    }
    @IBAction func facebookSignUp(){
    PFFacebookUtils.logInInBackgroundWithReadPermissions([]) {
        (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                } else {
                    print("User logged in through Facebook!")
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
    }
    }

    }
}