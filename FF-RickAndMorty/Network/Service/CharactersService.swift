//
//  CharactersService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol CharactersServiceable {
    func getCharacters(page: Int?) async -> Characters?
    func getCaracter(id: Int) async -> Character?
}

struct CharactersService: HTTPClient, CharactersServiceable {
    
    func getCharacters(page: Int?) async -> Characters? {
        let endpoint = CharactersEndpoint.characters(page: page ?? 0)
        do {
            return try await sendRequest(endpoint: endpoint, responseModel: Characters.self)
        } catch {
            return nil
        }
    }
    
    func getCaracter(id: Int) async -> Character? {
        let endpoint = CharactersEndpoint.character(id: id)
        do {
            return try await sendRequest(endpoint: endpoint, responseModel: Character.self)
        } catch {
            return nil
        }
    }
}
