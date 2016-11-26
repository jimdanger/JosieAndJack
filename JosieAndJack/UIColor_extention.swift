//
//  UIColor_extention.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable line_length
extension UIColor {
    
    struct Palette {
        
        struct PlayfullKids { // See, https://coolors.co/c2f9bb-9ad1d4-62c370-cc3363-20063b
            
            static func lightGreen() -> UIColor {
                return UIColor(colorLiteralRed: 194.0 / 255.0, green: 249.0 / 255.0, blue: 187.0 / 255.0, alpha: 1)
            }
            
            static func lightBlue() -> UIColor {
                return UIColor(colorLiteralRed: 154.0 / 255.0, green: 209.0 / 255.0, blue: 212.0 / 255.0, alpha: 1)
            }
            
            static func darkGreen() -> UIColor {
                return UIColor(colorLiteralRed: 98.0 / 255.0, green: 195.0 / 255.0, blue: 112.0 / 255.0, alpha: 1)
            }
            
            static func pink() -> UIColor {
                return UIColor(colorLiteralRed: 204.0 / 255.0, green: 51.0 / 255.0, blue: 99.0 / 255.0, alpha: 1)
            }
            
            static func darkPurple() -> UIColor {
                return UIColor(colorLiteralRed: 32.0 / 255.0, green: 6.0 / 255.0, blue: 59.0 / 255.0, alpha: 1)
            }
        }
        
        struct Another {
            static func boringColor() -> UIColor {
                return UIColor(colorLiteralRed: 154.0 / 255.0, green: 209.0 / 255.0, blue: 212.0 / 255.0, alpha: 1)
            }
        }
    }
}
