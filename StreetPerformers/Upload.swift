//
//  Upload.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Upload{
    
    
    let className =  "Performance"
    
    var bio: String
    var photo: UIImage?
    var rating: Int
    
    init(desc: String, img: UIImage?, rating: Int){
        self.bio = desc
        self.rating = rating
        photo = img
    }
    
    func uploadParseBackground(onSuccess: () -> (), onFailure: () -> ()){
        let uploadObject = PFObject(className: className)
        uploadObject["biography"] = bio
        if let img = photo{
        let imageData = UIImagePNGRepresentation(img)
        let imageFile = PFFile(name:"image.png", data:imageData!)
        uploadObject["image"] = imageFile
        }
        PFGeoPoint.geoPointForCurrentLocationInBackground {
            (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            if error == nil {
                uploadObject["location"] = geoPoint!
                
                uploadObject.saveInBackgroundWithBlock { (success, err) -> Void in
                    if(success && err == nil){
                        onSuccess()
                    }else{
                        onFailure()
                    }
                }

            }else{
                //maybe I need permission
                uploadObject.saveInBackgroundWithBlock { (success, err) -> Void in
                    if(success && err == nil){
                        onSuccess()
                    }else{
                        onFailure()
                    }
                }
            }
        }
        
        
    }
}