//
//  CharactersViewModelTests.swift
//  FF-RickAndMortyTests
//
//  Created by Bianca Ferreira on 06/02/24.
//

import Combine
import XCTest
@testable import FF_RickAndMorty

class CharactersViewModelTests: XCTestCase {
    private var sut: CharactersViewModel!
    private var characterService: MockCharactersService!
    
    override func setUpWithError() throws {
        characterService = MockCharactersService()
        sut = CharactersViewModel(service: characterService)
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        characterService = nil
        try super.tearDownWithError()
    }
    
    func test_on_API_success() {
        //given
        let exp = expectation(description: "Getting Characters")
        let characters = characterService.getJsonFrom(fileName: "CharactersMock", responseModel: Characters.self)
        characterService.mockCharactersResult = .success(characters!)
        
        //when
        sut.getCharacters(pageNumber: 1)
        sut.onSuccess = {
            exp.fulfill()
        }
        
        //then
        wait(for: [exp], timeout: 3)
        XCTAssertFalse(sut.characters.isEmpty)
        XCTAssertEqual(sut.characters.count, 20)
        XCTAssertEqual(sut.characters.first?.name, "Aqua Morty")
    }
    
    func test_on_API_failure() {
        let exp = expectation(description: "Getting Characters")
        characterService.mockCharactersResult = .failure(.decodingError)
        
        //when
        sut.getCharacters(pageNumber: 1)
        sut.onFailure = {
            exp.fulfill()
        }
        
        //then
        wait(for: [exp], timeout: 3)
        XCTAssertTrue(sut.characters.isEmpty)
        XCTAssertEqual(sut.characters.count, 0)
        XCTAssertNil(sut.characters.first?.name)
    }
}
