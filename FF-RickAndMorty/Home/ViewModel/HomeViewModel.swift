//
//  HomeViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import Foundation

class HomeViewModel {
    weak var coordinator: HomeCoordinator?
    
    func gotoCharacters() {
        coordinator?.showCharacters()
    }
}
