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
    var onSuccess: (() -> ())? { get set }
    var onFailure: (() -> ())? { get set }
    
    func getCharacters(pageNumber: Int)
    func getCharacter(id: Int)
}

class CharactersViewModel: CharacterViewModelProtocol {
    weak var coordinator: CharactersCoordinator?
    var service: CharactersServiceable?
    var characters: [Character] = []
    var onSuccess: (() -> ())?
    var onFailure: (() -> ())?
    
    init(service: CharactersServiceable?) {
        self.service = service
    }
    
    func gotoCharacterDetails(character: Character) {
        self.coordinator?.showCharacterDetails(character: character)
    }
    
    func getCharacters(pageNumber: Int) {
        Task(priority: .background) {
            let result = await service?.getCharacters(page: pageNumber)
            
            switch result {
            case .success(let characters):
                self.characters = characters.results
                self.onSuccess?()
                
            case .failure:
                self.onFailure?()
                
            default:
                break;
            }
        }
    }
    
    func getCharacter(id: Int) {
        Task(priority: .background) {
            let result = await self.service?.getCaracter(id: id)
            
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self.gotoCharacterDetails(character: character)
                }
                
            case .failure:
                self.onFailure?()
                
            default:
                break;
            }
        }
    }
}
