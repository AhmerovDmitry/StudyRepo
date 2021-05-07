//
//  ContactListDataSourceTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import XCTest
@testable import ContactList_app

class ContactListDataSourceTests: XCTestCase {
    var dataSource: ContactListDataSource!
    var mockTableView: MockTableView!
    var contactListVC: ContactListViewController!
    var person: Person!
    
    override func setUp() {
        super.setUp()
        dataSource = ContactListDataSource()
        dataSource.contactManager = ContactManager()
        
        mockTableView = MockTableView.mockTableView(withDataSource: dataSource)
        person = Person(name: "Foo", phone: "Bar")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        contactListVC = storyboard.instantiateViewController(identifier: "ContactListViewController") as? ContactListViewController
        
        contactListVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        dataSource = nil
        mockTableView = nil
        contactListVC = nil
        person = nil
        super.tearDown()
    }
    
    func testHasOneSection() {
        let numberIfSection = mockTableView.numberOfSections
        XCTAssertEqual(numberIfSection, 1)
    }
    
    func testNumberOfRowsEqualsContactListCount() {
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 1)
        
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Baz"))
        mockTableView.reloadData()
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnContactCell() {
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ContactCell)
    }
    
    func testCellForRowDequeuesCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataSource
        mockTableView.register(ContactCell.self, forCellReuseIdentifier: "cell")
        
        dataSource.contactManager?.add(person: Person(name: "Foo", phone: "Bar"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssert(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigureCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataSource
        mockTableView.register(MockContactCell.self, forCellReuseIdentifier: "cell")
        
        let person = Person(name: "Foo", phone: "Bar")
        dataSource.contactManager?.add(person: person)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockContactCell
        
        XCTAssertEqual(cell.person, person)
    }
    
}

extension ContactListDataSourceTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        static func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView()
            mockTableView.dataSource = dataSource
            mockTableView.register(MockContactCell.self, forCellReuseIdentifier: "cell")
            return mockTableView
        }
    }
    
    class MockContactCell: ContactCell {
        var person: Person?
        
        override func configure(with person: Person) {
            self.person = person
        }
    }
}

