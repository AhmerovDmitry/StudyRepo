//
//  api.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 04.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

struct JsonCharacters: Decodable {
    let results: [CharacterUrlInfo]?
}
struct CharacterUrlInfo: Decodable {
    let name: String?
    let species: String?
    let image: String?
}
