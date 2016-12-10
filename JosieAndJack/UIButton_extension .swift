//
//  UIButton_Extension .swift
//  JosieAndJack
//
//  Created by Jim Wilson on 12/10/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func stylePrimary() {
        self.layer.cornerRadius = 3.0
        self.backgroundColor = UIColor.Palette.PlayfullKids.pink()
        self.titleLabel?.font = FontManager.primaryFont
        self.titleLabel?.textColor = UIColor.black
    }
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}
