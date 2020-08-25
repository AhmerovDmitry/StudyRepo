//
//  MainViewController.swift
//  News App
//
//  Created by Дмитрий Ахмеров on 20.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let urlString = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,EUR,RUB"
    
    @IBOutlet weak var tableView: UITableView?
    let networkService = NetworkingService()
    var searchResponse: Money? = nil
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self

        networkService.getPrice(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
                self?.tableView?.reloadData()
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
        
        print(searchResponse)
    }
    
    func getData() {
        let urlString = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,EUR,RUB"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                let description = try JSONDecoder().decode(Money.self, from: data)
                print(description)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
