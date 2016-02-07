//
//  Category.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit
class Category{
    var description: String
    var image: UIImage
    
    init(description: String, image: UIImage){
        self.image = image
        self.description = description
    }
}