//
//  DetailViewController.swift
//  HW6
//
//  Created by Дмитрий Ахмеров on 2 Sivan 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var personInfo: Person!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = personInfo.fullName
        phoneLabel.text = personInfo.phone
        mailLabel.text = personInfo.mail
    }

}
