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
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var textFields: [UITextField]!
    
    var colorFromMainLabel: UIColor!
    var delegate: TableViewControllerDelegate?
    var colorCastNumber: Float = 255
    
    // MARK: - viewDidLoar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.cornerRadius = 25
        mainLabel.backgroundColor = colorFromMainLabel
        
        setValueForSlider()
        valuesForLabelsAndTextFields()
        
        for index in 0...countsOfElements() {
            textFields[index].addTarget(self, action: #selector(ChangeTextFieldInfo), for: .editingChanged)
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
