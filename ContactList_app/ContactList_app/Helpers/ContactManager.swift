//
//  ContactManager.swift
//  ContactList_app
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import Foundation

class ContactManager {
    var contactsCount: Int {
        return persons.count
    }
    private var persons: [Person] = []
    
    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }
    
    func person(at index: Int) -> Person {
        return persons[index]
    }
}
