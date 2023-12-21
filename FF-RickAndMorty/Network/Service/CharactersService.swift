//
//  CharactersService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol CharactersServiceable {
    func getCharacters() async -> Result<Characters, RequestError>
}

struct CharactersService: HTTPClient, CharactersServiceable {
    func getCharacters() async -> Result<Characters, RequestError> {
        return await sendRequest(endpoint: CharactersEndpoint.characters, responseModel: Characters.self)
    }
}
