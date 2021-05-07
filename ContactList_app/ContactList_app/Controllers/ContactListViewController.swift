//
//  ContactListViewController.swift
//  ContactList_app
//
//  Created by Дмитрий Ахмеров on 07.05.2021.
//

import UIKit

class ContactListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

}
