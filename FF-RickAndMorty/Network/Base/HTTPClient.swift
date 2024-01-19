//
//  HTTPClient.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T {
        let urlString = endpoint.url
        
        guard let url = URL(string: urlString) else {
            throw RequestError.invalidURL
        }
        
        //TODO: when the url needed headers, is necessary to see whats the problem with urlcomponents creation
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RequestError.invalidResponse
        }
        
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            throw RequestError.decodingError
        }
    }
}
