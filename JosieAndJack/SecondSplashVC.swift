//
//  SecondSplashVC.swift
//  JosieAndJack
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class SecondSplashVC: UIViewController {

    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       // hideEverything()
        
        
        
    }

    func hideEverything() {
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

        
        animateLabels()
        
    }
    
    func goToNextView() {
        performSegue(withIdentifier: Constants.Segues.splashToMain, sender: nil)
    }
    
    func animateLabels() {
        
        let sizeOfDevice = self.view.bounds.maxY
        let centerOfDevice = self.view.bounds.maxX / 2
         
        
        UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            
            
            self.labels[0].center = CGPoint(x: centerOfDevice, y: sizeOfDevice + self.labels[0].frame.height + 10)
            self.labels[1].center = CGPoint(x: centerOfDevice, y: sizeOfDevice + self.labels[1].frame.height + 50)
            
            
            }, completion: {
                (value: Bool) in
                self.goToNextView()
            }
        
            
        )
    
    
    }
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
 

}
