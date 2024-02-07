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
    
//    func test_API_Failure() {
//        let mockedService = MockCharactersService()
//        mockedService.characters = .failure(.invalidResponse)
//        let vm = CharactersViewModel(service: mockedService)
//        vm.service = mockedService
//        vm.getCharacters(pageNumber: 1)
//        
//        XCTAssert(vm.characters.isEmpty)
//    }
//    
//    func test_API_Success() {
//        let mockedService = MockCharactersService()
//        guard let characters = mockedService.readingJSONFile() else {
//            XCTFail("Fail to get characters")
//            return
//        }
//        mockedService.characters = .success(characters)
//        let vm = CharactersViewModel(service: mockedService)
//        vm.service = mockedService
//        vm.getCharacters(pageNumber: 1)
//        
//        XCTAssert(!characters.results.isEmpty)
//    }
}
