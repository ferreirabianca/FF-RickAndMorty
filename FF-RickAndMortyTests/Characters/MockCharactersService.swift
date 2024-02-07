//
//  MockCharactersService.swift
//  FF-RickAndMortyTests
//
//  Created by Bianca Ferreira on 06/02/24.
//

import Foundation
@testable import FF_RickAndMorty

class MockCharactersService: CharactersServiceable {
    var characters: Result<Characters, RequestError>!
    
    func getCharacters(page: Int?) async -> Result<Characters, RequestError> {
        return .failure(.decodingError)
    }
    
    func getCaracter(id: Int) async -> Result<Character, RequestError> {
        return .failure(.decodingError)
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
    
    func readingJSONFile() -> Characters? {
        // Name of your JSON file
        let filename = "CharactersMock"
        
        // Read JSON data from file
        if let jsonData = readJSONFromFile(filename: filename) {
            do {
                // Parse JSON data
                let decoder = JSONDecoder()
                let characters = try decoder.decode(Characters.self, from: jsonData)
                self.characters = .success(characters)
                return characters
            } catch {}
        }
        
        return nil
    }
    
}
