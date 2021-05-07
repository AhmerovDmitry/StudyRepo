//
//  Person.swift
//  ContactList_app
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import Foundation

struct Person {
    var name: String
    var surname: String?
    var phone: String
    var imageData: Data?
    private(set) var date: Date?
    
    init(name: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        self.imageData = imageData
        self.date = Date()
    }
    
    init(name: String, surname: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageData = imageData
        self.date = Date()
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.phone == rhs.phone
    }
}
