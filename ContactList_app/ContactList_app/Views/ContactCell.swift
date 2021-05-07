//
//  ContactCell.swift
//  ContactList_app
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with person: Person) {
        nameLabel.text = person.name
    }
}
