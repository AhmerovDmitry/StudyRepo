//
//  ViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableViewControllerDelegate {
    
    // MARK: - viewDidLoar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }
    
    // MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue", let destination = segue.destination as? TableViewController {
            destination.delegate = self
            destination.RGBColor = self.view.backgroundColor
        }
    }
    
    // MARK: - Delegate method (update(color: UIColor))
    func update(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    // MARK: - setNavigationBarHidden
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
