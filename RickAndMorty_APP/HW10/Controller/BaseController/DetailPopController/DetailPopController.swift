//
//  DetailPopController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 21.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class DetailPopController: UIViewController {
    
    fileprivate var transparentView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.layer.borderWidth = 2.5
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 25

        return image
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(DeatilPopControllerCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
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
        
        transparentView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.topAnchor.constraint(equalTo: transparentView.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: transparentView.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: transparentView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: transparentView.trailingAnchor, constant: 0).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
