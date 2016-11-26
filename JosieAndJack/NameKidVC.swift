//
//  NameKidVC.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 11/25/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class NameKidVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var kidName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Session.instance.bark()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BirthdayVC {
           vc.name = kidName
        }
    }
 
    // MARK: - Buttons
    @IBAction func nextPressed(_ sender: Any) {
        print(textField.text!)
        
        if let name = textField.text {
            kidName = name
        }
        performSegue(withIdentifier: "next", sender: self)
    }
}
