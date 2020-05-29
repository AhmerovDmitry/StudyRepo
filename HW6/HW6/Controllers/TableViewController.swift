//
//  TableViewController.swift
//  HW6
//
//  Created by Дмитрий Ахмеров on 2 Sivan 5780.
//  Copyright © 5780 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let persons = Person.randomList()

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonsList", for: indexPath)
        let person = persons[indexPath.row]

        cell.textLabel?.text = person.fullName

        return cell
    }

    // MARK: - Navigation

//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? DetailViewController {
//                detailVC.personInfo = persons[indexPath.row]
//            }
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow, let detailVC = segue.destination as? DetailViewController {
            detailVC.personInfo = persons[indexPath.row]
        }
    }
}
