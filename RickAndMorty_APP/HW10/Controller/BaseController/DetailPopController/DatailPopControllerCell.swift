//
//  DatailPopControllerCell.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 29.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

struct DetailCustomData {
    var text: String
}

class DetailCustomCell: UICollectionViewCell {
    var data: DetailCustomData? {
        didSet {
            guard let data = data else { return }
            cellButton.setTitle(data.text, for: .normal)
        }
    }
    //MARK: - cellButton
    let cellButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.layer.backgroundColor = UIColor.clear.cgColor
        btn.titleLabel?.font = UIFont(name: "Futura", size: 15)
        btn.titleLabel?.textAlignment = .center
    
        return btn
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cellButton)
        
        cellButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cellButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented DetailPopControllerCell")
    }
    
}
