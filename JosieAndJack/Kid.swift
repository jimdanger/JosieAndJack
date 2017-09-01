//
//  Kid.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation

class Kid {
    var name: String
    var birthday: Date?
    var notes: String?
    var isBorn: Bool {
        guard let unwrappedBirthday = birthday else {
            return false
        }
        return unwrappedBirthday <= Date()
    }
    
    var buttonText: String {
        return isBorn ? getAgeLabel() : getDueDateLabel()
    }

    private func getAgeLabel() -> String {
        var text = ""
        if let birthday = self.birthday {
            text = "\(self.name) is \(birthday.toAge())."
        } else {
            text = "\(self.name)"
        }
        return text
    }
    
    private func getDueDateLabel() -> String {
        var text = ""
        if let birthday = self.birthday {
            text = "\(self.name) due \(birthday.toString())."
        } else {
            text = "\(self.name)"
        }
        return "🤰" + text + "🤰"
    }
    
    
    init(name: String) {
        self.name = name
    }
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
