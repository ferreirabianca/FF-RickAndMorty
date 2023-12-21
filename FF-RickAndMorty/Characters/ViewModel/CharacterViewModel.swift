//
//  CharacterViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 20/12/23.
//

import Foundation

class CharacterViewModel {
    
}

// Protocol for handling network requests
protocol NetworkRequestable {
    func fetchData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void)
}

// Default implementation of the NetworkRequestable protocol
extension NetworkRequestable {
    func fetchData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            completion(.success(responseData))
        }
        
        task.resume()
    }
}

// Error enum for network-related errors
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

// Concrete object conforming to NetworkRequestable protocol
class NetworkManager: NetworkRequestable {
    static let shared = NetworkManager()
    private init() {}
}
