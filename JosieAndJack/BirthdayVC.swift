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
        print(Session.instance.fetchAll())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func donePressed(_ sender: Any) {
        let birthday:Date = datePicker.date
        let kid = Kid()
        kid.birthday = birthday
        kid.name = name
        Session.instance.save(kid: kid)
        
    }
}
