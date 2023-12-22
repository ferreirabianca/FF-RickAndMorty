//
//  LocationsEndpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

enum LocationsEndpoint {
    case location
    case locations(id: Int)
}

extension LocationsEndpoint: Endpoint {
    var path: String {
        switch self {
        case .location:
            return "/location"
            
        case .locations(let id):
            return "/location/\(id)"
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
