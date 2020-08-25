//
//  MoneyModel.swift
//  News App
//
//  Created by Дмитрий Ахмеров on 20.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

struct Money: Codable {
    var USD: Double?
    var EUR: Double?
    var RUB: Double?
}
// Function for parcing JSON

class NetworkingService {
    func getPrice(urlString: String, completion: @escaping (Result<Money, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let description = try JSONDecoder().decode(Money.self, from: data)
                    completion(.success(description))
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
