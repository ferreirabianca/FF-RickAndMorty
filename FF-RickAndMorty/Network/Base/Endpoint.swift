//
//  Endpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var url: String {
        return "\(self.scheme)\(self.host)\(self.path)"
    }
    
    var scheme: String {
        return "https://"
    }
    
    var host: String {
        return "rickandmortyapi.com/api"
    }
}
