//
//  MainStackViewVC.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class MainStackViewVC: UIViewController, AddKidDelegate, KidListViewDelegate {
    
    @IBOutlet weak var stackView: UIStackView!
    var kids: [Kid] = []
    var selectedKid: Kid?
    var buttons: [UIButton] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Palette.PlayfullKids.lightBlue()
        kids = Session.instance.fetchAll()
        makeButtons()
        addButtonsToStackView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.buttons.forEach {
                $0.isHidden = false
            }
            }, completion: nil)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - view
    func addButtonsToStackView() {
        for button in buttons {
            button.isHidden = true
            if !stackView.subviews.contains(button) {
                stackView.addArrangedSubview(button)
            }
        }
    }
    
    func makeButtons() {

        var tag = 0
        for kid in kids {
            buttons.append(makeButton(tag: tag, kid: kid))
            tag += 1
        }
    }
    
    func makeButton(tag: Int, kid: Kid) -> UIButton {
        let button: UIButton = UIButton(type: .system)
        
        let text: String = kid.buttonText

        if let font = UIFont(name: "Marker Felt", size: 15.0) {
            let attributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.black ]
            let title: NSAttributedString = NSAttributedString(string: text, attributes: attributes)
            button.setAttributedTitle(title, for: .normal)
        } else {
            button.setTitle(kid.name, for: .normal)
        }
        
        button.tag = tag
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    
    func buttonPressed(sender: UIButton) {
        print(sender.tag)
        selectedKid = kids[sender.tag]
        performSegue(withIdentifier: Constants.StoryboardIds.Segues.next.rawValue, sender: self)
        
        // do nothing else for now
        /*
        let button: UIButton = UIButton(type: .system)
        button.setTitle("new", for: .normal)
        button.isHidden = true
        stackView.addArrangedSubview(button)
        UIView.animate(withDuration: 0.3){
            button.isHidden = false
        }
        */
    }
    
    @IBAction func addPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: Constants.StoryboardIds.Segues.addKid.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UINavigationController {
            if let firstvc = vc.viewControllers[0] as? NameKidVC {
                firstvc.addKidDelegate = self
            }
        }
        
        if segue.destination is MainVC { /* complete this later */ }
        
        if let vc = segue.destination as? DetailVC {
            if let thisKid = selectedKid {
                vc.kid = thisKid
            }
            vc.parentView = self
        }
    }
    
    // MARK: AddKidDelegate method: 
    func addKid(kid: Kid) {
        kids.append(kid)
        let button = makeButton(tag: buttons.count, kid: kid)
        buttons.append(button)
        UIView.animate(withDuration: 0.3) {
            self.stackView.addArrangedSubview(button)
        }
    }

    // MARK: KidListViewDelegate method:
    func refreshList() {

        kids = Session.instance.fetchAll()
        for button in buttons {
            button.removeFromSuperview()
        }
        buttons = []
        makeButtons()
        addButtonsToStackView()
    }
}
