//
//  ViewController.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TableViewControllerDelegate {
    
    // MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableViewController {
            destination.colorFromMainLabel = view.backgroundColor
        }
    }
    
    // MARK: - unwindSegue
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? TableViewController {
            sourceViewController.delegate = self
            sourceViewController.setColor()
        }
    }

    // MARK: - Delegate method (update(color: UIColor))
    func update(color: UIColor) {
        view.backgroundColor = color
    }
    
    // MARK: - setNavigationBarHidden
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
