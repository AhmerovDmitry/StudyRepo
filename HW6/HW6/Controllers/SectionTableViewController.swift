//
//  SectionTableViewController.swift
//  HW6
//
//  Created by Дмитрий Ахмеров on 28.05.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    let persons = Person.randomList().map { ($0.fullName, [$0.mail, $0.phone]) }
    
//    func generate(array: [Person]) -> [(String,[String])] {
//        var temp: [(String,[String])] = []
//
//        array.forEach { (person) in
//            temp.append((person.fullName, [person.mail, person.phone]))
//        }
//        return temp
//    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return persons[section].0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = persons[indexPath.section].1[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
