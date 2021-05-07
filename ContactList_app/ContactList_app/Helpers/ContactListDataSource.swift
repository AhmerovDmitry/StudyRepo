//
//  ContactListDataSource.swift
//  ContactList_app
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import UIKit

class ContactListDataSource: NSObject {
    var contactManager: ContactManager?
}

extension ContactListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager?.contactsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell
        
        if let person = contactManager?.person(at: indexPath.row) {
            cell.configure(with: person)
        }
        
        return cell
    }
}
