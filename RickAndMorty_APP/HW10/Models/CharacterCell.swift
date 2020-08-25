//
//  CharacterCell.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 05.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterName: UILabel?
    @IBOutlet weak var characterSubtitle: UILabel?
    @IBOutlet weak var characterImage: ImageView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    func configure(with character: CharacterUrlInfo) {
        characterName?.text = character.name
        characterSubtitle?.text = character.species
        
        activityIndicator?.startAnimating()
        
//        DispatchQueue.global().async {
//            guard let imageURL = URL(string: character.image!) else { return }
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.characterImage?.image = UIImage(data: imageData)
//                self.activityIndicator?.stopAnimating()
//            }
//        }
        
        characterImage?.fetchImage(with: character.image)
    }
    
}
