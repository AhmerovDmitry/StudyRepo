//
//  ViewController.swift
//  HW2
//
//  Created by Дмитрий Ахмеров on 19 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet var arrayTextField: [UITextField]!
    @IBOutlet var arrayLabel: [UILabel]!
    @IBOutlet var arraySlider: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayLabel[0].text = "0"
        arrayLabel[1].text = "0"
        arrayLabel[2].text = "0"
        
        colorView.backgroundColor = .blue
        colorView.layer.cornerRadius = 20
        
        valueRange(max: 1, and: 0)
        
        for field in arrayTextField {
            field.keyboardType = .numberPad
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
    
    @IBAction func sliderAction() {
        for index in 0...2 {
            arrayLabel[index].text = String(Int(arraySlider[index].value * 255))
            arrayTextField[index].text = String(Int(arraySlider[index].value * 255))
        }
        arraySlider[0].minimumTrackTintColor = UIColor(red: CGFloat((arraySlider[0].value)), green: 0, blue: 0, alpha: 1)
        arraySlider[1].minimumTrackTintColor = UIColor(red: 0, green: CGFloat((arraySlider[1].value)), blue: 0, alpha: 1)
        arraySlider[2].minimumTrackTintColor = UIColor(red: 0, green: 0, blue: CGFloat((arraySlider[2].value)), alpha: 1)
        
        colorView.backgroundColor = UIColor(red: CGFloat(arraySlider[0].value),
                                            green: CGFloat(arraySlider[1].value),
                                            blue: CGFloat(arraySlider[2].value),
                                            alpha: 1)
    }
}
// remove keyboard use tap on view
extension UIViewController {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
