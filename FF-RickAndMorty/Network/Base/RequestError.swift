//
//  RequestError.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

//struct RequestError: Decodable, Error {
//    let msg: String
//    let statusCode: Int?
//}

enum RequestError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
