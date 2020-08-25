//
//  CharaterInfoViewController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 08.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class CharaterInfoViewController: UIViewController {
    
    @IBOutlet weak var characterInfoAvatar: UIImageView!
    @IBOutlet weak var characterInfoName: UILabel!
    @IBOutlet weak var characterInfoSubtitle: UILabel!
    
    var characterInfo: CharacterUrlInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        characterInfoName.text = characterInfo?.name
        characterInfoSubtitle.text = characterInfo?.species
        
        let imageUrl = URL(string: (characterInfo?.image)!)
        let imageData = try? Data(contentsOf: imageUrl!)
        characterInfoAvatar.image = UIImage(data: imageData!)
    }

}
