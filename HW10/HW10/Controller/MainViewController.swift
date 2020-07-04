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
    var searachResponse: JsonCharacters? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        networkService.fetchData(urlString: jsonUrl) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.searachResponse = searchResponse
                self?.tableView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searachResponse?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = searachResponse?.results![indexPath.row]
        
        if let image = self.networkService.getImage(from: (name?.image)!) {
        cell.imageView!.image = image
        }
        
        cell.textLabel?.text = name?.name
        cell.detailTextLabel?.text = name?.species
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
