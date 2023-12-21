//
//  CharactersEndpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

enum CharactersEndpoint {
    case characters
    case character(id: Int)
}

extension CharactersEndpoint: Endpoint {
    var path: String {
        switch self {
        case .characters:
            return "/character"
            
        case .character(let id):
            return "/character/\(id)"
        }
    }
    
    var method: RequestMethod {
        return .get
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
