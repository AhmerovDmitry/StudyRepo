//
//  BaseViewControllerDataSource.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 25.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension BaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.data[indexPath.row].image.bounds.size.width, height: 165)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.avatarButton.addTarget(self, action: #selector(showController), for: .touchUpInside)
        cell.data = self.data[indexPath.row]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - @objc methods
extension BaseViewController {
    @objc func showController() {
        isMove = !isMove
        showDetailPopController(shouldMove: isMove)
    }
}
