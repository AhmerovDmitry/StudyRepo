//
//  ViewController.swift
//  Prime Cost Calculator
//
//  Created by Дмитрий Ахмеров on 23 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var arrayProductTextField: [UITextField]!
    @IBOutlet var calcTextField: [UITextField]!
    @IBOutlet weak var result: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureToHideKeyboards()
    }

    @IBAction func calculation() {
        for index in 0...2 {
            if calcTextField[index].text == nil {
                print("nil")
            } else {
                calcTextField[index].text = "0"
            }
        }
    }
    
    @objc func redTextFieldDidChange() {}
    
    func addTapGestureToHideKeyboards() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

