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

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
}
