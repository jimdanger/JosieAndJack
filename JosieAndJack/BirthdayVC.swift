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
    
    var addKidDelegate: AddKidDelegate?
    @IBOutlet weak var datePicker: UIDatePicker!
    var name: String?
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Session.instance.fetchAll())
        setupView()
    }

    func setupView() {
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        doneButton.stylePrimary()
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
        guard let n = name else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        let kid = Kid(name: n)
        if shouldSetBirthday {
            kid.birthday = datePicker.date
        }
        Session.instance.save(kid: kid)
        addKidDelegate?.addKid(kid: kid)
        self.dismiss(animated: true, completion: nil)
    }
}
