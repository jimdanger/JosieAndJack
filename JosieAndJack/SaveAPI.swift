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
        } catch let error as NSError {
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
            guard let kidsFromCoreData = results as? [NSManagedObject] else {
                print("Could not unwrap as results from core data fetch")
                throw NSError(domain: "String", code: 000, userInfo: ["message":"Could not unwrap as results from core data fetch"])
            }
            for kidcore in kidsFromCoreData {
                let kid = Kid()
                if let name = kidcore.value(forKey: "name") as? String {
                    kid.name = name
                }
                if let birthday = kidcore.value(forKey: "birthday") as? Date {
                    kid.birthday = birthday
                }
                if let notes = kidcore.value(forKey: "notes") as? String {
                    kid.notes = notes
                }
                kids.append(kid)
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return kids
    }

    func update(kid: Kid) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not save to core data")
            return
        }
        
        guard let name = kid.name else {
            print("WARNING: could not save to core data - no name. name is used as key.")
            return
        }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KidCore")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        
        var kidsCoresToUpdate: [NSManagedObject] = []// fetch returns an array, even if only 1 element.
        do {
            // swiftlint:disable force_cast
            kidsCoresToUpdate = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            // swiftlint:enable force_cast
        } catch {
            fatalError("Failed to fetch kid: \(error)")
        }
        
        for kidcore in kidsCoresToUpdate {
            kidcore.setValue(kid.notes, forKey: "notes")
        }
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not delete \(error), \(error.userInfo)")
        }
    }
    
    
    func delete(kid: Kid) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not save to core data")
            return
        }

        guard let name = kid.name else {
            print("WARNING: could not save to core data - no name. name is used as key.")
            return
        }

        let managedObjectContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KidCore")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)


        var kidsToDelete: [NSManagedObject] = []// fetch returns an array, even if only 1 element.
        do {
            // swiftlint:disable force_cast
            kidsToDelete = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            // swiftlint:enable force_cast
        } catch {
            fatalError("Failed to fetch kid: \(error)")
        }

        for kid in kidsToDelete {
            managedObjectContext.delete(kid)
        }

        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not delete \(error), \(error.userInfo)")
        }
    }
}

struct Session {
    static let instance: SaveAPI = SaveAPI()
}
