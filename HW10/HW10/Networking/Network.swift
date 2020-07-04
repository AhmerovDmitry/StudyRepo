//
//  Network.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 04.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class NetworkService {
    
        func fetchData(urlString: String, completion: @escaping (Result<JsonCharacters, Error>) -> Void) {
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Some error")
                        completion(.failure(error))
                        return
                    }
                    guard let data = data else { return }
                    do {
                        let names = try JSONDecoder().decode(JsonCharacters.self, from: data)
                        completion(.success(names))
                    } catch let jsonError {
                        print("Failed to decode JSON", jsonError)
                        completion(.failure(jsonError))
                    }
                }
            }.resume()
        }
}
