//
//  ViewController.swift
//  HW9
//
//  Created by Дмитрий Ахмеров on 13.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var nameForAnimation: UILabel!
    
    @IBAction func buttonForAnimation(_ sender: SpringButton) {
        
        randomAnimation()
        
    }
    
}
