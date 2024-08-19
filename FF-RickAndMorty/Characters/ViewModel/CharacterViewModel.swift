//
//  CharacterViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 20/12/23.
//

import Foundation
import RxSwift
import RxCocoa
import Differentiator

struct SectionOfCharacters {
    var header: String
    var items: [Character]
}

extension SectionOfCharacters: SectionModelType {
    init(original: SectionOfCharacters, items: [Character]) {
        self = original
        self.items = items
    }
}

protocol CharacterViewModelProtocol {
    //inputs
    var fetchCharacters: PublishSubject<Void> { get }
    
    //outputs
    var sections: Driver<[SectionOfCharacters]> { get }
//    var isLoading: Driver<Bool> { get }
    var error: Driver<Error> { get }
}

class CharactersViewModel: CharacterViewModelProtocol {
    //MARK: Properties
    var coordinator: CharactersCoordinator?
    var fetchCharacters = PublishSubject<Void>()
    var sections: Driver<[SectionOfCharacters]>
//    var isLoading: Driver<Bool>
    var error: Driver<Error>

    //MARK: Private Properties
//    private var service = CharactersService.shared
    private let disposeBag = DisposeBag()
    
    //MARK: Init
    init(coordinator: CharactersCoordinator, service: CharactersService = .shared) {
        self.coordinator = coordinator
        let result = fetchCharacters
            .flatMapLatest {
                service.getCharacters()
                    .asObservable()
                    .materialize()
            }
            .share()
        
        print(result.map({ caracters in
            caracters
        }))
        
        self.sections = result
            .compactMap({ $0.element?.results })
            .map({ characters in
                let firstSection = SectionOfCharacters(header: "testes", items: characters)
                return [firstSection]
            })
            .asDriver(onErrorJustReturn: [])
        
        self.error = result
            .compactMap { $0.error }
            .asDriver(onErrorDriveWith: .empty())
    }
    
    //MARK: Functions
    func getCharacters() {
        
    }
}
