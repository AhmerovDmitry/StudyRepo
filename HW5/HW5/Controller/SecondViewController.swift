//
//  SecondViewController.swift
//  HW5
//
//  Created by Дмитрий Ахмеров on 27 Iyar 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var tailLabel: UILabel!
    
    @IBOutlet weak var secretInfo: UIButton!
    @IBOutlet weak var secretLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secretInfo.alpha = 0.2
        
        headLabel.text = "Welcome User!"
        bodyLabel.text = "Glad to see you in my app!"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func infoButton() {
        secretLabel.text = "Name: Admin \nPassword: Admin"
    }
}
