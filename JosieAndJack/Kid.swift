//
//  Kid.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation

class Kid {
    var name: String?
    var birthday: Date?
    /// add more as needed:
        // geolocation
        // notes

    init() {}
    init(name: String) {
        self.name = name
    }
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
