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
    
    private let userName = "User"
    private let userPassword = "Password"
    private let adminName = "Admin"
    private let adminPassword = "Admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //addTapGestureToHideKeyboard()
    }
    // Alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    // Logic for "Log In" button
    @IBAction func logInButton() {
        if textFieldName.text == userName && textFieldPassword.text == userPassword {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(identifier: "UserVC") as! SecondViewController
            
            newViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
            newViewController.modalPresentationStyle = .fullScreen // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
            
            self.present(newViewController, animated: true, completion: nil)
            
            textFieldName.text = ""
            textFieldPassword.text = ""
        } else if textFieldName.text == adminName && textFieldPassword.text == adminPassword {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(identifier: "AdminVC") as! AdminViewController
            
            newViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
            newViewController.modalPresentationStyle = .fullScreen // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
            
            self.present(newViewController, animated: true, completion: nil)
            
            textFieldName.text = ""
            textFieldPassword.text = ""
        } else {
            showAlert(title: "Error", message: "Incorrect information!")
        }
    }
    
    // Logic for "Forgot User Name?"
    @IBAction func forgotNameButton() {
        showAlert(title: "User Name", message: userName)
    }
    // Logic for "Forgot User Password?"
    @IBAction func forgotPasswordButton() {
        showAlert(title: "User Password", message: userPassword)
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
}
// MARK: Text Field Deligate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
