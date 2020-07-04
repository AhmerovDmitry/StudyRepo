//
//  RandomNumber.swift
//  MagicBall
//
//  Created by Дмитрий Ахмеров on 13.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

extension ViewController {
    
    // MARK: - Method for call random number
    
    func randomNumber() -> Int {
        var result = 0
        
        if let firstNumber = Int(firstTextField.text!), let secondNumber = Int(secondTextField.text!) {
            if firstNumber < secondNumber {
                result = Int.random(in: firstNumber...secondNumber)
            } else if firstNumber > secondNumber {
                result = Int.random(in: secondNumber...firstNumber)
            }
        } else {
            alarmController()
        }
        return result
    }
    
    // MARK: - Alert Controller
    
    func alarmController() {
        let alert = UIAlertController(title: "Ошибка!", message: "Проверьте правильность чисел.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        self.present(alert, animated: true)
    }
    
}
