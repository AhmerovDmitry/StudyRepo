//
//  ContactListViewControllerTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import XCTest
@testable import ContactList_app

class ContactListViewControllerTests: XCTestCase {
    
    var sut: ContactListViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ContactListViewController") as? ContactListViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedContactListDataSourceIsNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListDataSource)
    }
    
}
