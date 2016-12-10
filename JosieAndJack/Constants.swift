//
//  Constants.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//
// 
// swiftlint:disable nesting 

import Foundation

struct Constants {

    struct Birthdays {

        // Jack = 3/3/15 at 3:00pm
        // Allie: Born to Kim and Elizabeth Billeter on August 27th, 2014 at 3:08 PM and weighing in at 9 lb 14 oz she is 21” long,
        // Josie: june 21, 2013
        // Diego: ??

        // see, http://stackoverflow.com/questions/24089999/how-do-you-create-a-swift-date-object

        static let jack: Date = Date(timeIntervalSince1970: 1425358800)
        static let josie: Date = Date(timeIntervalSince1970: 1371787200)
        static let allie: Date = Date(timeIntervalSince1970: 1409112000)
        static let diego: Date = Date(timeIntervalSince1970: 1465790400)

    }



    
    struct StoryboardIds {
        
        enum Segues: String {
            case
            splashToHardCode =  "splashToHardCode",
            addKid = "addKid",
            next =  "next",
            tableView = "tableView"
            
        }
        struct CellReuseIds {
            
            static let main =  "MainCell"
        }
        
        
    }

    struct GeoLocations {

        static let jacksHouse =  ""  // ... ?d
    }
}
