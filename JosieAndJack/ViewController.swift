//
//  ViewController.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        printDates()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printDates(){
        print("jack: \(Constants.Birthdays.jack.toString())")
        print("josie: \(Constants.Birthdays.josie.toString())")
        print("diego: \(Constants.Birthdays.diego.toString())")
        print("allie: \(Constants.Birthdays.allie.toString())")
        
    }

    

}

