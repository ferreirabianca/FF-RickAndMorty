//
//  CharacterViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 20/12/23.
//

import Foundation

class CharactersViewModel {
    weak var coordinator: CharactersCoordinator?
    var service: CharactersServiceable?
    
    func getCaracters(completion: @escaping (Result<Characters, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getCharacters() else {
                return
            }
            completion(result)
        }
    }
}
