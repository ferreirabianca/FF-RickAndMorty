//
//  CharactersService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol CharactersServiceable {
    func getCharacters(page: Int?) async -> Result<Characters, RequestError>
    func getCaracter(id: Int) async -> Result<Character, RequestError>
}

struct CharactersService: HTTPClient, CharactersServiceable {    
    func getCharacters(page: Int?) async -> Result<Characters, RequestError> {
        let endpoint = CharactersEndpoint.characters(page: page ?? 0)
        return await sendRequest(endpoint: endpoint, responseModel: Characters.self)
    }
    
    func getCaracter(id: Int) async -> Result<Character, RequestError> {
        let endpoint = CharactersEndpoint.character(id: id)
        return await sendRequest(endpoint: endpoint, responseModel: Character.self)
    }
}
