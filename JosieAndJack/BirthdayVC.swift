    //
//  BirthdayVC.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 11/25/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit
import CoreData

class BirthdayVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        testFetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func donePressed(_ sender: Any) {
        let birthday:Date = datePicker.date
        let kid = KidModel()
        kid.birthday = birthday
        kid.name = name
        print(kid)
        
    
        if let name = name {
            saveKid(name: name, birthday: birthday)
        }
    }
    
    func saveKid(name: String, birthday: Date) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not save to core data")
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        
        let entity =  NSEntityDescription.entity(forEntityName: "Kid",
                                                 in:managedContext)
        let kid = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        kid.setValue(name, forKey: "name")
        kid.setValue(birthday, forKey: "birthday")
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func testFetch(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("WARNING: could not save to core data")
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Kid")
        
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            let kids = results as! [NSManagedObject]
            print(kids)
            // kids[0].value(forKey: "birthday")!
            // kids[0].value(forKey: "name")!
            
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let _ = ""
    }

}
