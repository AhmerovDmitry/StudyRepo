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
    @IBOutlet weak var resultButtonOutlet: UIButton!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureToHideKeyboards()
        
        resultButtonOutlet.layer.cornerRadius = 10
    }

    @IBAction func calculation() {
        let numberCount = 4
        for index in 0...2 {
            if calcTextField[index].text!.count > numberCount {
                calcTextField[index].text = "0"
            }
        }
    }
    
    @IBAction func resultButton() {
        result.text = String(Int(calcTextField[1].text!)! * Int(calcTextField[2].text!)! / Int(calcTextField[0].text!)!)
    }
    
    //@objc func redTextFieldDidChange() {}
    func addTapGestureToHideKeyboards() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

