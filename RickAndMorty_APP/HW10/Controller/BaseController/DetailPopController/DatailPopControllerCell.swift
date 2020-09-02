//
//  DatailPopControllerCell.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 29.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class DeatilPopControllerCell: UICollectionViewCell {
    
    private let bg: UIImageView = {
        let bg = UIImageView()
        bg.frame.size = CGSize(width: 100, height: 100)
        bg.backgroundColor = .yellow
        
        return bg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented DetailPopControllerCell")
    }
    
}
