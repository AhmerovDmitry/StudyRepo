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
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(identifier: "UserVC") as! SecondViewController
            
            newViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
            newViewController.modalPresentationStyle = .fullScreen // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
            
            self.present(newViewController, animated: true, completion: nil)
            
            textFieldName.text = ""
            textFieldPassword.text = ""
        } else if textFieldName.text == "Admin" && textFieldPassword.text == "Admin" {
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
        showAlert(title: "User Name", message: "User")
    }
    // Logic for "Forgot User Password?"
    @IBAction func forgotPasswordButton() {
        showAlert(title: "User Password", message: "Password")
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
    }
}

