//
//  HTTPClient.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        //url i was using urlcomponents, but its not working properly because of the /api, used on url, temporary solution
        let urlString = "\(endpoint.scheme)\(endpoint.host)\(endpoint.path)"
        //TODO: when the url needed headers, is necessary to see whats the problem with urlcomponents creation
        
        guard let url = URL(string: urlString) else {
            return .failure(.init(msg: "url not found", statusCode: 404))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.init(msg: "no response found", statusCode: 404))
            }
            debugPrint(response.statusCode)
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.init(msg: "decode error", statusCode: 404))
                }
                return .success(decodedResponse)
                
            default:
                guard let error = try? JSONDecoder().decode(RequestError.self, from: data) else {
                    return .failure(.init(msg: "decode error failed", statusCode: 404))
                }
                return .failure(.init(msg: error.msg, statusCode: error.statusCode))
            }
            
        } catch {
            return .failure(.init(msg: "unkown", statusCode: 500))
        }
    }
}
