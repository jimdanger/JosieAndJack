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
    var addKidDelegate: AddKidDelegate?
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        nextButton.backgroundColor = UIColor.Palette.PlayfullKids.pink()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BirthdayVC {
            vc.name = kidName
            vc.addKidDelegate = addKidDelegate
        }
    }
  
    // MARK: - Buttons
    @IBAction func nextPressed(_ sender: AnyObject) {
        print(textField.text!)
        
        if let name = textField.text {
            kidName = name
        }
        performSegue(withIdentifier: "next", sender: self)
        
    }
}
