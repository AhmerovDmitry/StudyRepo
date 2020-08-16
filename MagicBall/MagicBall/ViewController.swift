//
//  ViewController.swift
//  MagicBall
//
//  Created by Дмитрий Ахмеров on 13.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var numberInBall: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    // MARK: - @IBActions
    @IBAction func resultButton(_ sender: UIButton) {
        numberInBall.text = String(restrictions())
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
    
    // MARK: - Properties
    let minNumber = 0
    let maxNumber = 99
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstNumberCount), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondNumberCount), for: .editingChanged)
    }
}
