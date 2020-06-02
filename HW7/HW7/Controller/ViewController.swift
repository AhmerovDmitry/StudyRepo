//
//  ViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorLabel: UIView!

    @IBAction func saveData(_ unwindSegue: UIStoryboardSegue) {
        if let source = unwindSegue.source as? TableViewController {
            colorLabel.backgroundColor = source.mainLabel.backgroundColor
        }
    }
}


