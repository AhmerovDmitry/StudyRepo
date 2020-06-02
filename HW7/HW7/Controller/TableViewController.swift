//
//  TableViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var mainLabel: UIView!
    @IBOutlet var sliderForChangeColor: [UISlider]!
    @IBOutlet var changeValueLabel: [UILabel]!
    @IBOutlet var changeValueTextField: [UITextField]!
    
    var colorLabel: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.cornerRadius = 25
        mainLabel.backgroundColor = colorLabel
        for index in 0...2 {
            changeValueLabel[index].text = "127"
            changeValueTextField[index].text = "127"
        }
        RGBColor()
    }
    
    func RGBColor() {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        
        if (mainLabel.backgroundColor?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha))! {

            sliderForChangeColor[0].value = Float(fRed)
            sliderForChangeColor[1].value = Float(fGreen)
            sliderForChangeColor[2].value = Float(fBlue)
            
            for index in 0...sliderForChangeColor.count - 1 {
                changeValueLabel[index].text = String(Int((sliderForChangeColor[index].value) * Float(255)))
                changeValueTextField[index].text = changeValueLabel[index].text
            }
        }
    }
    
    @IBAction func changeValueSlider() {
        mainLabel.backgroundColor = UIColor(
            red: CGFloat(sliderForChangeColor[0].value),
            green: CGFloat(sliderForChangeColor[1].value),
            blue: CGFloat(sliderForChangeColor[2].value),
            alpha: 1
        )

        for index in 0...2 {
            changeValueLabel[index].text = String(Int((sliderForChangeColor[index].value) * Float(255)))
            changeValueTextField[index].text = changeValueLabel[index].text
        }
    }
    
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
