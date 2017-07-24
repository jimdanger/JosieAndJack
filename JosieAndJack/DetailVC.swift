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
        setupView()
        setupKeyboardObservers()
    }

    func setupView() {
        scrollView.isScrollEnabled = false
        bindViewElements()
        rightBarButtonItem.title = "Save"
        rightBarButtonItem.action = #selector(save(sender:))
    }


    func bindViewElements() {

        navigationItem.title = kid?.name

        if let birthday = kid?.birthday {
            age.text = birthday.toAge()
            ageDetail.text = "born: \(birthday.toString())."
        } else {
            age.text = kid?.name
            ageDetail.text = "" // blank if no bday
        }
    }


    @IBAction func switchToggled(_ sender: Any) {
        print(remindSwitch.isOn)
    }


    // MARK:- buttons:

    func dismissKeyboard() {
        notes.resignFirstResponder()
    }
    func save(sender: UIBarButtonItem) {
        print("save")
    }


    @IBAction func deletePressed(_ sender: Any) {
        deleteKid()
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
        print("keyboardWillShow")
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
        print("keyboardWillHide")
        scrollView.isScrollEnabled = false

        var keyboardAnimationTime: TimeInterval = 0.25
        if let animationTime = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval) {
            keyboardAnimationTime = animationTime
        }
        UIView.animate(withDuration: keyboardAnimationTime) {
            self.scrollView.contentOffset.y = 0.0
            self.bottomConstraint.constant = 0.0
        }
        rightBarButtonItem.title = "Save"
        rightBarButtonItem.action = #selector(save(sender:))
    }
}
