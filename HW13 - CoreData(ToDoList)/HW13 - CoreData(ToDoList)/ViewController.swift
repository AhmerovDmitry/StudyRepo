//
//  ViewController.swift
//  HW13 - CoreData(ToDoList)
//
//  Created by Дмитрий Ахмеров on 28.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    private let cellID = "cell"
    private let tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        settingsForNavigationBar()
    }
    
    private func settingsForNavigationBar() {
//        title = "ToDo"
//
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
//
//        navigationController?.navigationBar.barTintColor = .blue
//
//        //navigationController?.navigationBar.prefersLargeTitles = true
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+",
//                                                            style: .plain,
//                                                            target: self,
//                                                            action: #selector(addNewTask))
        
        title = "Tasks list"
        
        // Title color
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        // Navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(
            displayP3Red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        
        // Set large title
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add button to navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(addNewTask)
        )
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func addNewTask() {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Новая заметка", message: "Введите текст заметки", preferredStyle: .alert)
        let saveButton = UIAlertAction(title: "Сохранить", style: .default, handler: { _ in
            guard let newValue = alert.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
        })
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
    }
}

//MARK: - Extension for UITableViewController settings
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
