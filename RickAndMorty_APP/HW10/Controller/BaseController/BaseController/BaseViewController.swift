//
//  BaseViewController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 20.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    // MARK: - Properties
    var isMove = false
    let data = [
        CustomData(title: "1", image: UIImageView(image: #imageLiteral(resourceName: "bold")), text: "SPACESHIP"),
        CustomData(title: "2", image: UIImageView(image: #imageLiteral(resourceName: "light")), text: ""),
        CustomData(title: "3", image: UIImageView(image: #imageLiteral(resourceName: "light")), text: ""),
        CustomData(title: "4", image: UIImageView(image: #imageLiteral(resourceName: "light")), text: ""),
        CustomData(title: "5", image: UIImageView(image: #imageLiteral(resourceName: "bold")), text: "FIVE")
    ]
    // MARK: - collectionView
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()
    // MARK: - backgroundImage
    fileprivate let backgroundImage: UIImageView = {
        var img = UIImageView()
        img = UIImageView(image: #imageLiteral(resourceName: "background_main"))
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backgroundImage, collectionView].forEach { view.addSubview($0) }
        
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.backgroundColor = .clear
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 177).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2.5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2.5).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
