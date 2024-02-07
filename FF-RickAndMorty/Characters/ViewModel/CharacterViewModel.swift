//
//  CharacterViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 20/12/23.
//

import Foundation

protocol CharacterViewModelProtocol {
    var coordinator: CharactersCoordinator? { get set }
    var characters: [Character] { get }
    var onSuccess: (() -> (Void))? { get set }
    var onFailure: (() -> (Void))? { get set }
    
    func getCharacters(pageNumber: Int)
}

class CharactersViewModel: CharacterViewModelProtocol {
    weak var coordinator: CharactersCoordinator?
    var service: CharactersServiceable?
    var characters: [Character] = []
    var onSuccess: (() -> (Void))?
    var onFailure: (() -> (Void))?
    
    init(service: CharactersServiceable?) {
        self.service = service
    }
    
    func gotoCharacterDetails(character: Character) {
        self.coordinator?.showCharacterDetails(character: character)
    }
    
    func getCharacters(pageNumber: Int) {
        Task(priority: .low) {
            let result = await service?.getCharacters(page: pageNumber)
            
            switch result {
            case .success(let characters):
                self.characters = characters.results
                self.onSuccess?()
                
            case .failure(_):
                self.onFailure?()
            default:
                break;
            }
        }
    }
    
    func getCharacter(id: Int, completion: @escaping (Character) -> Void) {
//        Task(priority: .background) {
//            guard let result = await self.service?.getCaracter(id: id) else {
//                return
//            }
//            completion(result)
//        }
    }
}
