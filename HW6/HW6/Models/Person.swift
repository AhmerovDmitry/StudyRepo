//
//  Person.swift
//  HW6
//
//  Created by Дмитрий Ахмеров on 2 Sivan 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import Foundation

struct Person {
    var personFirstName: String
    var personSecondName: String
    var personMail: String
    var personPhone: String
    
    var personFullName: String! {
        personFirstName + " " + personSecondName
    }
        
    static func addPerson() -> [Person] {
        
        var persons = [Person]()
        
        let names = name.shuffled()
        let secondNames = secondName.shuffled()
        let mails = mail.shuffled()
        let phones = phone.shuffled()
        
        for index in 0..<name.count {
            let person = Person(personFirstName: names[index],
                                personSecondName: secondNames[index],
                                personMail: mails[index],
                                personPhone: phones[index])
            persons.append(person)
        }
        return persons
    }
}

let name = ["Дмитрий", "Олег", "Андрей", "Александр", "Антон"]
let secondName = ["Ахмеров", "Русских", "Уваров", "Нихаев", "Сунгуров"]
let mail = ["first@mail.swift", "second@mail.swift", "third@mail.swift", "fourth@mail.swift", "fifth@mail.swift"]
let phone = ["9102345678", "9201345678", "9301245678", "9401235678", "9501234678"]





