//
//  MainViewController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 04.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let jsonUrl = "https://rickandmortyapi.com/api/character"
    let networkService = NetworkService()
    var searchResponse: JsonCharacters? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
                
        networkService.fetchData(urlString: jsonUrl) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
                self?.tableView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell

        let character = searchResponse?.results?[indexPath.row]
        cell.configure(with: character!)
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let characterInfoVC = segue.destination as! CharaterInfoViewController
            characterInfoVC.characterInfo = searchResponse?.results![indexPath.row]
        }
    }
}
