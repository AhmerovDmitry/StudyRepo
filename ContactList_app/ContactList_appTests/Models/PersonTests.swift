//
//  PersonTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import XCTest
@testable import ContactList_app

class PersonTests: XCTestCase {
    
    var image: UIImage?
    var imageData: Data?
    
    override func setUp() {
        super.setUp()
        
        image = UIImage(named: "userAvatar")
        imageData = image?.pngData()
    }
    
    override func tearDown() {
        image = nil
        imageData = nil
        
        super.tearDown()
    }
    
    func testInitPersonWithNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person)
    }
    
    func testInitPersonWithFullNameAndPhone() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person)
    }
    
    func testWhenGivenNameAndPhoneSetsNameAndPhone() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertEqual(person.name, "Foo")
        XCTAssertEqual(person.phone, "Bar")
    }
    
    func testWhenGivenSurnameSetSurname() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertTrue(person.surname == "Bar")
    }
    
    func testInitPersonWithDate() {
        let person = Person(name: "Foo", phone: "Bar")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithSurnameAndDate() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz")
        XCTAssertNotNil(person.date)
    }
    
    func testInitPersonWithImage() {
        let person = Person(name: "Foo", phone: "Bar", imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
    
    func testInitPersonWithSurnameAndImage() {
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imageData: imageData)
        XCTAssertNotNil(person.imageData)
    }
    
}
