//
//  MainStackViewVC.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//

import UIKit

class MainStackViewVC: UIViewController, AddKidDelegate {
    
    @IBOutlet weak var stackView: UIStackView!
    var kids: [Kid] = []
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
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            self.buttons.forEach {
                $0.isHidden = false
            }
            }, completion: nil)
        
        
    }

    // MARK: - view
    func addButtonsToStackView() {
        for button in buttons {
            button.isHidden = true
            if !stackView.subviews.contains(button){
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
    
    func makeButton(tag: Int, kid:Kid) -> UIButton {
        let button: UIButton = UIButton(type: .system)
        guard let name = kid.name else {
            return button
        }
        var text: String = ""
        if let birthday = kid.birthday {
            text = "\(name) is \(birthday.toAge())."
        }else {
            text = "\(name)"
        }
        
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
    
    func buttonPressed(sender: UIButton){
        print(sender.tag)
        
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
        performSegue(withIdentifier: Constants.StoryboardIds.Segues.next.rawValue, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UINavigationController {
            if let firstvc = vc.viewControllers[0] as? NameKidVC { // TODO: protect against empty array
                firstvc.addKidDelegate = self
            }
        }
    }
    
    func addKid(kid: Kid) {
        let button = makeButton(tag: buttons.count, kid: kid)
        buttons.append(button)
        UIView.animate(withDuration: 0.3){
            self.stackView.addArrangedSubview(button)
        }
    }
}
