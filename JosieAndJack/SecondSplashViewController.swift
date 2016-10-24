//
//  SecondSplashViewController.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class SecondSplashViewController: UIViewController {

    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("SecondSplashViewController viewDidLoad")
        // Do any additional setup after loading the view.
        
        for label in self.labels {
            label.isHidden = true
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondSplashViewController viewDidAppear")
            performSegue(withIdentifier: Constants.Segues.splashToMain, sender: nil)
        
    }
    
    
    
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
 

}
