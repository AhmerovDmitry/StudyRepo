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
        
        arraySlider[0].minimumValue = 0
        arraySlider[0].maximumValue = 1
        arraySlider[1].minimumValue = 0
        arraySlider[1].maximumValue = 1
        arraySlider[2].minimumValue = 0
        arraySlider[2].maximumValue = 1
    }

    
    @IBAction func sliderAction() {
        arrayLabel[0].text = String(Int(arraySlider[0].value * 255))
        arrayLabel[1].text = String(Int(arraySlider[1].value * 255))
        arrayLabel[2].text = String(Int(arraySlider[2].value * 255))
        
        arrayTextField[0].text = String(Int(arraySlider[0].value * 255))
        arrayTextField[1].text = String(Int(arraySlider[1].value * 255))
        arrayTextField[2].text = String(Int(arraySlider[2].value * 255))
        
        arraySlider[0].minimumTrackTintColor = UIColor(red: CGFloat((arraySlider[0].value)), green: 0, blue: 0, alpha: 1)
        arraySlider[1].minimumTrackTintColor = UIColor(red: 0, green: CGFloat((arraySlider[1].value)), blue: 0, alpha: 1)
        arraySlider[2].minimumTrackTintColor = UIColor(red: 0, green: 0, blue: CGFloat((arraySlider[2].value)), alpha: 1)
        
        colorView.backgroundColor = UIColor(red: CGFloat(arraySlider[0].value),
                                            green: CGFloat(arraySlider[1].value),
                                            blue: CGFloat(arraySlider[2].value),
                                            alpha: 1)
    }
    
    
}

