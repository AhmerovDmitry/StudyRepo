//
//  DetailViewControllerTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 14.05.2021.
//

import XCTest
@testable import ContactList_app

class DetailViewControllerTests: XCTestCase {

    var detailVC: DetailViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        detailVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        detailVC = nil
        super.tearDown()
    }
    
    func testHasNameLabel() {
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.nameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasPhoneLabel() {
        XCTAssertNotNil(detailVC.phoneLabel)
        XCTAssertTrue(detailVC.phoneLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasSurnameLabel() {
        XCTAssertNotNil(detailVC.surnameLabel)
        XCTAssertTrue(detailVC.surnameLabel.isDescendant(of: detailVC.view))
    }
    
    func testHasImageView() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }
    
    func testSetValueToNameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.nameLabel.text, "Foo")
    }
    
    func testSetValueToSurnameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.surnameLabel.text, "Bar")
    }
    
    func testSetValueToPhoneLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.phoneLabel.text, "Baz")
    }
    
    func setValueToImageView() {
        setupContactAndAppearanceTrancition()
        let imageData = #imageLiteral(resourceName: "userAvatar").pngData()
        XCTAssert(detailVC.person.imageData == imageData)
    }

    func testImageViewNotNil() {
        setupContactAndAppearanceTrancition()
        XCTAssertNotNil(detailVC.imageView.image)
    }
    
    func setupContactAndAppearanceTrancition() {
        let image = #imageLiteral(resourceName: "userAvatar")
        let imageData = image.pngData()
        let person = Person(name: "Foo", surname: "Bar", phone: "Baz", imageData: imageData)
        detailVC.person = person
        
        detailVC.beginAppearanceTransition(true, animated: true)
        detailVC.endAppearanceTransition()
    }
}
