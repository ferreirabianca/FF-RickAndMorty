//
//  Endpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation
import Alamofire


enum Endpoint {
    case characters
    case locations
    case episodes
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = HTTP.scheme
        components.host = HTTP.host
        components.path = "/api\(path)"
        return components.url
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/character"
        case .locations:
            return "/location"
        case .episodes:
            return "/episode"
        }
    }
}
