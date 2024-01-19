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
    
    func gotoCharacterDetails(character: Character) {
        self.coordinator?.showCharacterDetails(character: character)
    }
    
    func getCaracters(pageNumber: Int, completion: @escaping ([Character]) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getCharacters(page: pageNumber) else {
                return
            }
            completion(result.results)
        }
    }
    
    func getCharacter(id: Int, completion: @escaping (Character) -> Void) {
        Task(priority: .background) {
            guard let result = await self.service?.getCaracter(id: id) else {
                return
            }
            completion(result)
        }
    }
}
