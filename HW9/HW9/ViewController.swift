//
//  ViewController.swift
//  HW9
//
//  Created by Дмитрий Ахмеров on 13.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    var index = 0

    // MARK: - @IBOutlets
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var nameForAnimation: UILabel!
    @IBOutlet weak var runButtonOutlet: UIButton!
    
    // MARK: - @IBActions
    
    @IBAction func buttonForAnimation(_ sender: SpringButton) {
        
        randomAnimation()
        
    }
    
}
