//
//  ViewController.swift
//  HW2
//
//  Created by Дмитрий Ахмеров on 19 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet var arrayTextField: [UITextField]!
    @IBOutlet var arrayLabel: [UILabel]!
    @IBOutlet var arraySlider: [UISlider]!
    
    let colorNumber: Float = 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // label settings
        arrayLabel[0].text = "0"
        arrayLabel[1].text = "0"
        arrayLabel[2].text = "0"
        // view settings
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = .black
        // slider settings
        valueRange(max: 1, and: 0)
        // text field settings
        for (index, field) in arrayTextField.enumerated() {
            field.keyboardType = .numberPad
            arrayTextField[index].addTarget(self, action: #selector(redTextFieldDidChange), for: .editingChanged)
        }
        // remove keyboard use tap on view
        addTapGestureToHideKeyboard()
    }
    // change max and min value in slider
    func valueRange(max: Float, and min: Float) {
        for value in arraySlider {
            value.maximumValue = max
            value.minimumValue = min
        }
    }
    // UIAlertController
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    //
    @objc func redTextFieldDidChange() {
        for index in 0...2 {
            if let number = Float(arrayTextField[index].text!) {
                arrayLabel[index].text = arrayTextField[index].text
                arraySlider[index].value = number / colorNumber
            } else {
                arrayLabel[index].text = "0"
                arraySlider[index].value = 0
                arrayTextField[index].text = ""
            }
            
            let maxNumberCount = 1...3
            var numberCount = [String]()
            for i in arrayTextField[index].text! {
                numberCount.append(String(i))
            }
            
            if let textNumber = Int(arrayTextField[index].text!) {
                if textNumber <= 255 && maxNumberCount.contains(numberCount.count) {
                    // UIAlertAction
                } else {
                    showAlert(title: "Unknown number", message: "Need to write a new number")
                    arrayLabel[index].text = "0"
                    arraySlider[index].value = 0
                    arrayTextField[index].text = ""
                }
            }
        }
        colorView.backgroundColor = UIColor(red: CGFloat(Float(arrayLabel[0].text!)! / colorNumber), green: CGFloat(Float(arrayLabel[1].text!)! / colorNumber), blue: CGFloat(Float(arrayLabel[2].text!)! / colorNumber), alpha: 1)
        arraySlider[0].minimumTrackTintColor = UIColor(red: CGFloat(Float(arrayLabel[0].text!)! / colorNumber), green: 0, blue: 0, alpha: 1)
        arraySlider[1].minimumTrackTintColor = UIColor(red: 0, green: CGFloat(Float(arrayLabel[1].text!)! / colorNumber), blue: 0, alpha: 1)
        arraySlider[2].minimumTrackTintColor = UIColor(red: 0, green: 0, blue: CGFloat(Float(arrayLabel[2].text!)! / colorNumber), alpha: 1)
    }
    // slider
    @IBAction func sliderAction() {
        for index in 0...2 {
            arrayTextField[index].text = String(Int(arraySlider[index].value * colorNumber))
            arrayLabel[index].text = arrayTextField[index].text
        }
        colorView.backgroundColor = UIColor(red: CGFloat(Float(arrayLabel[0].text!)! / colorNumber), green: CGFloat(Float(arrayLabel[1].text!)! / colorNumber), blue: CGFloat(Float(arrayLabel[2].text!)! / colorNumber), alpha: 1)
        arraySlider[0].minimumTrackTintColor = UIColor(red: CGFloat(Float(arrayLabel[0].text!)! / colorNumber), green: 0, blue: 0, alpha: 1)
        arraySlider[1].minimumTrackTintColor = UIColor(red: 0, green: CGFloat(Float(arrayLabel[1].text!)! / colorNumber), blue: 0, alpha: 1)
        arraySlider[2].minimumTrackTintColor = UIColor(red: 0, green: 0, blue: CGFloat(Float(arrayLabel[2].text!)! / colorNumber), alpha: 1)
    }
}
// remove keyboard use tap on view
extension UIViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
