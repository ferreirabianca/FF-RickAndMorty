//
//  HomeViewControllerTests.swift
//  FF-RickAndMortyTests
//
//  Created by Bianca Ferreira on 07/02/24.
//

import SnapshotTesting
import XCTest
@testable import FF_RickAndMorty

class HomeViewControllerTests: XCTestCase {
    private let sut = HomeViewController()
    
    func test_view_controller_snapshoot() {
        assertSnapshot(matching: sut, as: .image)
    }
    
    func test_custom_view_snapshot() {
        //given
        let view = HomeCategoryView()
        view.setupView(title: "Episodios", imageName: "episodes-home-icon", backgroundColor: .red.withAlphaComponent(0.3))
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 40, height: 100)
        
        //then
        assertSnapshot(matching: view, as: .image)
    }
}
