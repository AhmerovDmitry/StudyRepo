//
//  AdminViewController.swift
//  HW5
//
//  Created by Дмитрий Ахмеров on 27 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    @IBOutlet weak var aboutMeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeOutlet.setTitle("About Me", for: .normal)
    }
    
    @IBAction func aboutMeButton() {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
