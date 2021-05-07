//
//  ContactManagerTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import XCTest
@testable import ContactList_app

class ContactManagerTests: XCTestCase {

    var contactManager: ContactManager!
    var person: Person!
    
    override func setUp() {
        super.setUp()
        contactManager = ContactManager()
        person = Person(name: "Foo", phone: "Bar")
    }
    
    override func tearDown() {
        contactManager = nil
        person = nil
        super.tearDown()
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactListCount() {
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    func testContactAddIndexIsAddedPerson() {
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        XCTAssertEqual(contactManager.contactsCount, 1)
    }

}
