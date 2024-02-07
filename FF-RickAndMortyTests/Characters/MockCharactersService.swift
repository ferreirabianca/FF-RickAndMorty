//
//  MockCharactersService.swift
//  FF-RickAndMortyTests
//
//  Created by Bianca Ferreira on 06/02/24.
//

import Foundation
@testable import FF_RickAndMorty

class MockCharactersService: CharactersServiceable {
    var mockCharactersResult: Result<Characters, RequestError>?
    var mockCharacterResult: Result<Character, RequestError>?
    
    func getCharacters(page: Int?) async -> Result<Characters, RequestError> {
        if let mockCharactersResult {
            return mockCharactersResult
        }
        return .failure(.invalidResponse)
    }
    
    func getCaracter(id: Int) async -> Result<Character, RequestError> {
        if let mockCharacterResult {
            return mockCharacterResult
        }
        return .failure(.invalidResponse)
    }
    
    func readJSONFromFile(filename: String) -> Data? {
        // Find the test bundle
        let bundle = Bundle(for: type(of: self))
        
        // Find the URL to the JSON file in the test bundle
        if let fileURL = bundle.url(forResource: filename, withExtension: "json") {
            do {
                // Read the contents of the file
                let data = try Data(contentsOf: fileURL)
                return data
            } catch {}
        }
        return nil
    }
    
    func getJsonFrom<T: Decodable>(fileName: String, responseModel: T.Type) -> T? {
        
        // Read JSON data from file
        if let jsonData = readJSONFromFile(filename: fileName) {
            do {
                // Parse JSON data
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: jsonData)
                return model
            } catch {}
        }
        
        return nil
    }
}
