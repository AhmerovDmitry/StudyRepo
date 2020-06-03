//
//  TableViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

protocol TableViewControllerDelegate {
    func update(color: UIColor)
}

class TableViewController: UITableViewController {
    
    @IBOutlet weak var mainLabel: UIView!
    @IBOutlet var sliderForChangeColor: [UISlider]!
    @IBOutlet var changeValueLabel: [UILabel]!
    @IBOutlet var changeValueTextField: [UITextField]!
    
    
    
    // MARK: - viewDidLoar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.cornerRadius = 25
        for index in 0...countsOfElements() {
            changeValueLabel[index].text = "127"
            changeValueTextField[index].text = "127"
        }
        changeMainLabel(color: RGBColor!)
    }
    
    // MARK: - Sliders
    @IBAction func changeValueSlider() {
        mainLabel.backgroundColor = UIColor(
            red: CGFloat(sliderForChangeColor[0].value),
            green: CGFloat(sliderForChangeColor[1].value),
            blue: CGFloat(sliderForChangeColor[2].value),
            alpha: 1
        )
        changeValueInLabelAndTextField()
    }

    // MARK: - Change color after change of View
    var RGBColor: UIColor?
    
    func changeMainLabel(color: UIColor) {
        mainLabel.backgroundColor = color
        
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        
        if mainLabel.backgroundColor?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) != nil {
            sliderForChangeColor[0].value = Float(fRed)
            sliderForChangeColor[1].value = Float(fGreen)
            sliderForChangeColor[2].value = Float(fBlue)
            mainLabel.alpha = fAlpha
            
            changeValueInLabelAndTextField()
        }
    }
    
    // MARK: - Delegate
    var delegate: TableViewControllerDelegate?
    
    @IBAction func pressButton(sender: UIButton) {
        if let viewColor = mainLabel.backgroundColor {
            delegate?.update(color: viewColor)
            navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Table view data source (setNavigationBarHidden & deselectRow)
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
