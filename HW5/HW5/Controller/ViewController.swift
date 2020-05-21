//
//  ViewController.swift
//  HW5
//
//  Created by Дмитрий Ахмеров on 27 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //addTapGestureToHideKeyboard()
    }
    // Alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    // Logic for "Log In" button
    @IBAction func logInButton() {
        if textFieldName.text == "User" && textFieldPassword.text == "Password" {
        } else {
            showAlert(title: "Error", message: "Incorrect information!")
        }
    }
    // Logic for "Forgot User Name?"
    @IBAction func forgotNameButton() {
        showAlert(title: "User Name", message: "User")
    }
    // Logic for "Forgot User Password?"
    @IBAction func forgotPasswordButton() {
        showAlert(title: "User Password", message: "Password")
    }
    
    // Remove keyboard use tap on view
//    func addTapGestureToHideKeyboard() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(view.endEditing))
//        view.addGestureRecognizer(tapGesture)
//    }
}

