//
//  api.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 04.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

struct JsonCharacters: Decodable {
    let results: [Character]?
}
struct Character: Decodable {
    let name: String?
    let image: String?
    let species: String?
}
