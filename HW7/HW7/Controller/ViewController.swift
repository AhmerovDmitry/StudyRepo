//
//  ViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }
    
    @IBAction func saveData(_ unwindSegue: UIStoryboardSegue) {
        if let source = unwindSegue.source as? TableViewController {
            self.view.backgroundColor = source.mainLabel.backgroundColor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let color = segue.destination as? TableViewController {
            color.colorLabel = self.view.backgroundColor
        }
    }
    
}


