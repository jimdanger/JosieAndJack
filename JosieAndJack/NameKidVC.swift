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
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        nextButton.stylePrimary()
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
        
        guard let text = textField.text else {
            nextButton.shake()
            return
        }
        if text.isEmpty {
            nextButton.shake()
            return
        }
        if let name = textField.text {
            kidName = name
        }
        performSegue(withIdentifier: "next", sender: self)
    }
}
