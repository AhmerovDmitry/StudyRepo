//
//  Person.swift
//  HW6
//
//  Created by Дмитрий Ахмеров on 2 Sivan 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import Foundation

struct Person {
    let firstName: String
    let secondName: String
    let mail: String
    let phone: String
    
    var fullName: String! {
        [firstName, secondName].joined(separator: " ")
    }
        
    static func randomList() -> [Person] {
        
        var persons: [Person] = []
        
        let names = Constants.name.shuffled()
        let secondNames = Constants.secondName.shuffled()
        let mails = Constants.mail.shuffled()
        let phones = Constants.phone.shuffled()
        
        for index in 0..<Constants.name.count {
            let person = Person(firstName: names[index],
                                secondName: secondNames[index],
                                mail: mails[index],
                                phone: phones[index])
            persons.append(person)
        }
        return persons
    }
}

private extension Person {
    enum Constants {
        static let name = ["Дмитрий", "Олег", "Андрей", "Александр", "Антон"]
        static let secondName = ["Ахмеров", "Русских", "Уваров", "Нихаев", "Сунгуров"]
        static let mail = ["first@mail.swift", "second@mail.swift", "third@mail.swift", "fourth@mail.swift", "fifth@mail.swift"]
        static let phone = ["9102345678", "9201345678", "9301245678", "9401235678", "9501234678"]
    }
}





