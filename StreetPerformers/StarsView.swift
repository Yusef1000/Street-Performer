//
//  StarsView.swift
//  StreetPerformers
//
//  Created by Jacob on 2/6/16.
//  Copyright © 2016 Jacob. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class StarsView: UIView{
    
    var starValue = 0
    func getValue() -> Int{
        return starValue
    }
    var ratingButtons = [UIButton]()
    var starWidth = CGFloat(0.0)
    let emptyStarImage = UIImage(named: "star-1")!
    let filledStarImage = UIImage(named:"star-2")!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        starWidth = self.frame.height - CGFloat(5.0)
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: starWidth, height: starWidth))
            button.setImage(UIImage(named: "star-11-1"), forState: .Normal)
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            button.adjustsImageWhenHighlighted = false
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: starWidth, height: starWidth)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(CGFloat(index) * (starWidth + CGFloat(5)))
            button.frame = buttonFrame
        }
    }
    func ratingButtonTapped(button: UIButton) {
        starValue = ratingButtons.indexOf(button)! + 1
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index >= self.starValue
        }

    }

    func setValue(i : Int){
        self.starValue = i
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index >= i
        }
    }

}