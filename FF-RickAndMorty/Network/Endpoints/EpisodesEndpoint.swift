//
//  EpisodesEndpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

enum EpisodesEndpoint {
    case episodes(pageNumber: Int)
    case episode(id: Int)
}

extension EpisodesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .episodes(let pageNumber):
            return "/episode?page=\(pageNumber)"
        case .episode(let id):
            return "/episode/\(id)"
        }
    }
    
    var method: RequestMethod {
        .get
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
