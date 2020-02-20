//
//  ViewController.swift
//  iOS-Swift-CustomKeyboard
//
//  Created by Pooya on 2020-02-19.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text:UITextField!
    @IBOutlet weak var number:UITextField!{
        didSet { number?.addDoneCancelToolbar()}
    }
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var phone:UITextField!{
        didSet { phone?.addDoneCancelToolbar()}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        text.delegate = self
        number.delegate = self
        email.delegate = self
        phone.delegate = self

    }

    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

//        let textTag = textField.tag+1
//        let nextResponder = textField.superview?.superview?.viewWithTag(textTag)
//        if(nextResponder != nil)
//        {
//            nextResponder?.becomeFirstResponder()
//        }
//        else{
//            // stop editing on pressing the done button on the last text field.
//            self.view.endEditing(true)
//        }
        return true
    }
    
}


extension UITextField {
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar : UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Next", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Cancel", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    //Defualt actions :
    @objc func cancelButtonTapped() {
        self.resignFirstResponder()

//        let textTag = self.tag+1
//        let nextResponder = self.superview?.superview?.viewWithTag(textTag)
//        if(nextResponder != nil)
//        {
//            //textField.resignFirstResponder()
//            nextResponder?.becomeFirstResponder()
//        }
//        else{
//            // stop editing on pressing the done button on the last text field.
//
//            self.endEditing(true)
//        }
//        return
    }
    @objc func doneButtonTapped() { self.resignFirstResponder()}

}
