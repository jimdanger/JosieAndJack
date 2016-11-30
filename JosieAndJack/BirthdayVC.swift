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
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Session.instance.fetchAll())
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        doneButton.backgroundColor = UIColor.Palette.PlayfullKids.pink()
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    @IBAction func donePressed(_ sender: Any) {
        done()
    }
    
    func done() {
        let birthday:Date = datePicker.date
        let kid = Kid()
        kid.birthday = birthday
        kid.name = name
        Session.instance.save(kid: kid)
    }
}
