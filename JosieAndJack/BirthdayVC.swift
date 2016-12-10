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
    @IBOutlet weak var doneButton: UIButton!
    var name: String?


    override func viewDidLoad() {
        super.viewDidLoad()

        print(Session.instance.fetchAll())
        setupView()
    }

    func setupView() {
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        doneButton.stylePrimary()
        datePicker.maximumDate = Date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func donePressed(_ sender: Any) {
        done(shouldSetBirthday: true)
    }
    
    @IBAction func skipPressed(_ sender: Any) {
        done(shouldSetBirthday: false)
    }
    
    func done(shouldSetBirthday: Bool) {
        let kid = Kid()
        kid.name = name
        if shouldSetBirthday {
            let birthday: Date = datePicker.date
            kid.birthday = birthday
        }
        Session.instance.save(kid: kid)
        // segue to main.
        let _ = ""
    }
}
