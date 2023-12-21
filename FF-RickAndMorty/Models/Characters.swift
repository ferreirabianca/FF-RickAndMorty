//
//  Characters.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

struct Characters: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
