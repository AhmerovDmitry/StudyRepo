//
//  CustomCell.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 25.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

// MARK: - CustomCell for UICollectionViewCell
struct CustomData {
    var title: String
    var image: UIImageView
    var text: String
}
class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image.image
            cellText.text = data.text
        }
    }
    // MARK: - cellText
    fileprivate let cellText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Futura", size: 35)
        
        return label
    }()
    // MARK: - backgroundCell
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 25
        iv.isUserInteractionEnabled = true

        return iv
    }()
    // MARK: - avatarButton
    let avatarButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 20
        btn.setTitle("🚀", for: .normal)
        
        return btn
    }()
    // MARK: - Init contentView + other view for cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        bg.addSubview(cellText)
        cellText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        cellText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        bg.addSubview(avatarButton)
        avatarButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        avatarButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        avatarButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        avatarButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
