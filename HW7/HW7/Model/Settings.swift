//
//  Settings.swift
//  HW7
//
//  Created by Дмитрий Ахмеров on 01.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class Settings: TableViewController {
    
}


extension TableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.layer.cornerRadius = 25
        mainLabel.backgroundColor = UIColor(red: 0.5,
                                            green: 0.5,
                                            blue: 0.5,
                                            alpha: 1)
        for index in 0...2 {
            changeValueLabel[index].text = "127"
            changeValueTextField[index].text = "127"
        }
    }
}
