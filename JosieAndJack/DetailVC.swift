//
//  DetailVC.swift
//  JosieAndJack
//
//  Created by James Wilson on 12/4/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//


import UIKit

class DetailVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var ageDetail: UILabel!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var remindSwitch: UISwitch!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    var kid: Kid?
    var parentView: KidListViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    func setupView() {
        scrollView.isScrollEnabled = false
        bindViewElements()
        hideRightBarButtonItem()
    }
    func hideRightBarButtonItem() {
        rightBarButtonItem.title = ""
        rightBarButtonItem.action = nil
    }
    
    
    func bindViewElements() {
        guard let k = kid else{
            return
        }
        navigationItem.title = k.name

        if let birthday = k.birthday {
            if k.isBorn {
                bindForBirthday(birthday: birthday)
            } else {
                bindForDueDate(birthday: birthday)
            }
        } else {
            age.text = k.name
            ageDetail.text = "" // blank if no bday
        }
        
        
        if let s = k.notes {
            notes.text = s
        } else {
            notes.text = ""
        }
    }
    
    func bindForBirthday(birthday: Date) {
        age.text = birthday.toAge()
        ageDetail.text = "born: \(birthday.toString())."
    }
    
    func bindForDueDate(birthday: Date) {
        age.text = kid?.name
        ageDetail.text = "due \(birthday.toString())"
    }
    
    @IBAction func switchToggled(_ sender: Any) {
        print(remindSwitch.isOn)
    }
    
    
    // MARK:- buttons:
    func dismissKeyboard() {
        notes.resignFirstResponder()
    }
    
    func updateKid() {
        guard let note = notes.text else {
            return
        }
        if let k = kid {
            kid?.notes = note
            Session.instance.update(kid: k)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParentViewController { // means 'back' pressed
            updateKid()
            parentView?.refreshList()
        }
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        showConfirmationPrompt()
        
    }
    
    func showConfirmationPrompt() {
        let alert = UIAlertController(title: title,
                                      message: "Are you sure?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Go back",
                                         style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Yes, delete",
                                         style: .destructive,
                                         handler: { (alert) in
                                            self.deleteKid()
            })
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func deleteKid() {
        
        if let k = kid {
            Session.instance.delete(kid: k)
        }
        parentView?.refreshList()
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK:- keyboard:
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        scrollView.isScrollEnabled = true
        
        var keyboardHeight: CGFloat = 258.0 // fallback in case ' if let ...' fails to set exact value
        var keyboardAnimationTime: TimeInterval = 0.25 // fallback in case ' if let ...' fails to set value
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
        }
        if let animationTime = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) {
            keyboardAnimationTime = animationTime
        }
        bottomConstraint.constant = keyboardHeight
        
        // determine how much to scroll, if at all:
        let screenHeight = view.frame.size.height
        let bottomTextFieldDistanceFromBottom = screenHeight - (notes.frame.origin.y + notes.frame.size.height)
        let buffer: CGFloat = 10.0
        var distanceToMove: CGFloat = 0.0
        if keyboardHeight > (bottomTextFieldDistanceFromBottom - buffer) {
            distanceToMove = ((keyboardHeight - bottomTextFieldDistanceFromBottom) + (buffer * 3))
        }
        UIView.animate(withDuration: keyboardAnimationTime) {
            self.scrollView.contentOffset.y = distanceToMove
        }
        rightBarButtonItem.title = "Dismiss Keyboard"
        rightBarButtonItem.action = #selector(dismissKeyboard)
    }
    
    func keyboardWillHide (notification: NSNotification) {
        scrollView.isScrollEnabled = false
        
        var keyboardAnimationTime: TimeInterval = 0.25
        if let animationTime = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) {
            keyboardAnimationTime = animationTime
        }
        UIView.animate(withDuration: keyboardAnimationTime) {
            self.scrollView.contentOffset.y = 0.0
            self.bottomConstraint.constant = 0.0
        }
        hideRightBarButtonItem()
    }
}
