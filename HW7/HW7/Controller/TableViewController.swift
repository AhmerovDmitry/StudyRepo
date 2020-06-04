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
    
    var RGBColor: UIColor?
    var delegate: TableViewControllerDelegate?
    var colorCastNumber = 255
    
    // MARK: - viewDidLoar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.cornerRadius = 25
        for index in 0...countsOfElements() {
            changeValueLabel[index].text = "127"
            changeValueTextField[index].text = "127"
            
            changeValueTextField[index].addTarget(self, action: #selector(ChangeTextFieldInfo), for: .editingChanged)
        }
        changeMainLabel(color: RGBColor!)
    }
    
    // MARK: - Table view data source (setNavigationBarHidden & deselectRow)
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
