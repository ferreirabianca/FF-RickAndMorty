//
//  CharacterService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol CharacterServiceable {
    func getCaracter(id: Int) async -> Result<Character, RequestError>
}

struct CharacterService: HTTPClient, CharacterServiceable {
    func getCaracter(id: Int) async -> Result<Character, RequestError> {
        let endpoint = CharactersEndpoint.character(id: id)
        return await sendRequest(endpoint: endpoint, responseModel: Character.self)
    }
}
