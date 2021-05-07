//
//  ContactCellTests.swift
//  ContactList_appTests
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import XCTest
@testable import ContactList_app

class ContactCellTests: XCTestCase {
    var cell: ContactCell!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ContactListViewController") as! ContactListViewController
        viewController.loadViewIfNeeded()
        
        let tableView = viewController.tableView
        let dataSource = MockTableViewDataSource()
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "cell", for: IndexPath(row: 0, section: 0)) as? ContactCell
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testCellHasNameLabel() {
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasNameLabelInContentView() {
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsName() {
        let person = Person(name: "Foo", phone: "Bar")
        cell.configure(with: person)
        XCTAssertEqual(cell.nameLabel.text, person.name)
    }

}

extension ContactCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
