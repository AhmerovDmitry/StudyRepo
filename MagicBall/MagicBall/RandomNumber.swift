//
//  RandomNumber.swift
//  MagicBall
//
//  Created by Дмитрий Ахмеров on 13.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

extension ViewController {
    
    // MARK: - Min and max number
    func restrictions() -> Int {
        var result = 0
        guard let numberOne = Int(firstTextField.text!) else { return result }
        guard let numberTwo = Int(secondTextField.text!) else { return result }
        
        if (numberOne < minNumber || numberOne > maxNumber) || (numberTwo < minNumber || numberTwo > maxNumber) {
            alarmController()
            
            firstTextField.text = ""
            secondTextField.text = ""
        } else {
            if let firstNumber = Int(firstTextField.text!), let secondNumber = Int(secondTextField.text!) {
                if firstNumber < secondNumber {
                    result = Int.random(in: firstNumber...secondNumber)
                } else if firstNumber > secondNumber {
                    result = Int.random(in: secondNumber...firstNumber)
                }
            } else {
                alarmController()
            }
        }
        return result
    }
    
    // MARK: - Settings for TextFields counts
    @objc func firstNumberCount() {
        var firstTextFieldCount = [String]()
        for value in firstTextField.text! {
            firstTextFieldCount.append(String(value))
        }
        if firstTextFieldCount.count > 2 {
             alarmController()
             firstTextField.text = ""
        }
    }
    
    @objc func secondNumberCount() {
        var secondTextFieldCount = [String]()
        for value in secondTextField.text! {
            secondTextFieldCount.append(String(value))
        }
        if secondTextFieldCount.count > 2 {
             alarmController()
             secondTextField.text = ""
        }
    }
    
    // MARK: - Alert Controller
    func alarmController() {
        let alert = UIAlertController(title: "Ошибка!", message: "Проверьте правильность чисел.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        self.present(alert, animated: true)
    }
}
