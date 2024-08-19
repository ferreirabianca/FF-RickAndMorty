//
//  CharactersService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation
import RxSwift

class CharactersService {
    //MARK: Properties
    static let shared = CharactersService()
    
    //MARK: Private Properties
    private var service = APIService()
    
    //MARK: Functions
    func getCharacters() -> Single<Characters> {
        let request = Endpoint.characters
        return service.makeRequest(request.url!, request.method)
    }
}
