//
//  DetailPopController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 21.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class DetailPopController: UIViewController {
    
    lazy fileprivate var transparentView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.layer.borderWidth = 2.5
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 25

        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 7.0, y: 368.0 * 2, width: 400.0, height: 400.0)
        view.backgroundColor = .clear
        view.layer.borderWidth = 2.5
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25

        view.addSubview(transparentView)
        transparentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
