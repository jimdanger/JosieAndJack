//
//  ViewController.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jack: UILabel!
    @IBOutlet weak var josie: UILabel!
    @IBOutlet weak var diego: UILabel!
    @IBOutlet weak var allie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupiew()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupiew() {
        josie.text = "Josie is \(Constants.Birthdays.josie.toAge())."
        jack.text = "Jack is \(Constants.Birthdays.jack.toAge())/"
        diego.text = "Diego is \(Constants.Birthdays.diego.toAge())."
        allie.text = "Allie is \(Constants.Birthdays.allie.toAge())."
        
    }
    

}

