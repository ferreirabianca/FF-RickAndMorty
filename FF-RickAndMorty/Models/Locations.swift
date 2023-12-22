//
//  Locations.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

struct Locations: Codable {
    let info: Info
    let results: [Location]
}

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
