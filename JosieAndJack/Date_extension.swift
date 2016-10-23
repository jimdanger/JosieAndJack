//
//  Date_extension.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .none
        
        let dateString = formatter.string(from: self)
        
        return dateString
    }
    
}
