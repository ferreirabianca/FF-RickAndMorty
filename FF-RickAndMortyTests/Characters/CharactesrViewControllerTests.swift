//
//  CharactesrViewControllerTests.swift
//  FF-RickAndMortyTests
//
//  Created by Bianca Ferreira on 07/02/24.
//

import SnapshotTesting
import XCTest
@testable import FF_RickAndMorty

class CharactesrViewControllerTests: XCTestCase {
    
    func test_view_controller_snapshoot() {
        let vc = CharactersViewController()
        
        assertSnapshot(matching: vc, as: .image)
    }
    
    func test_custom_table_view_cell_snapshot() {
        //given
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80)
        let view = CharactersCell(frame: frame)
        let characterData = CharactersCellData(name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/234.jpeg", status: "Dead")
        view.setupCell(character: characterData)
        
        //when
        
        //then
        assertSnapshot(matching: view, as: .image)
    }
}
