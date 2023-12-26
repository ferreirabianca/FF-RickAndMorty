//
//  CharacterDetailsCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class CharacterDetailsCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    let viewModel = CharacterDetailsViewModel()
    var character: Character?
    
    init(childCoordinator: [Coordinator], navController: UINavigationController, character: Character) {
        self.childCoordinator = childCoordinator
        self.navController = navController
        self.character = character
    }
    
    func start() {
        let vc = CharacterDetailsViewController()
        vc.character = character
        vc.viewModel = viewModel
        vc.viewModel?.coordinator = self
        
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    
}
