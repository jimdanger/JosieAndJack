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
    
    @IBOutlet var labels: [UILabel]! {
        didSet {
            labels.forEach {
                $0.isHidden = true
            }
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupview()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        UIView.animate(withDuration: 1.1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.labels.forEach {
                $0.isHidden = !$0.isHidden
            }
            }, completion: nil)
        
    }
    
    
    func setupview() {
        
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        
        
        josie.text = "Josie is \(Constants.Birthdays.josie.toAge())."
        jack.text = "Jack is \(Constants.Birthdays.jack.toAge())."
        diego.text = "Diego is \(Constants.Birthdays.diego.toAge())."
        allie.text = "Allie is \(Constants.Birthdays.allie.toAge())."
    }
    

}

