//
//  SaveAPI.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 11/26/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SaveAPI {
    
    func bark() {
        print("woof")
    }
    
    func save(kid: Kid) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not save to core data")
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: "KidCore",
                                                 in:managedContext)
        let kidcore = NSManagedObject(entity: entity!,
                                  insertInto: managedContext)
        kidcore.setValue(kid.name, forKey: "name")
        kidcore.setValue(kid.birthday, forKey: "birthday")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func fetchAll() -> [Kid] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not access core data")
            return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KidCore")
        
        var kids: [Kid] = []
        
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            let kidsFromCoreData = results as! [NSManagedObject]
            print(kidsFromCoreData)
            for kidcore in kidsFromCoreData {
                let kid = Kid()
                if let name = kidcore.value(forKey: "name") as? String {
                    kid.name = name
                }
                if let birthday = kidcore.value(forKey: "birthday") as? Date {
                    kid.birthday = birthday
                }
                kids.append(kid)
            }
            
            // kids[0].value(forKey: "birthday")!
            // kids[0].value(forKey: "name")!
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let _ = ""
        
        return kids
    }
}

struct Session {
    static let instance: SaveAPI = SaveAPI()
}
