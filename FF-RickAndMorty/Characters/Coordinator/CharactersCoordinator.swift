//
//  CharactersCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 21/12/23.
//

import UIKit

class CharactersCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    
    init(childCoordinator: [Coordinator], navController: UINavigationController) {
        self.childCoordinator = childCoordinator
        self.navController = navController
    }
    
    func start() {
        let vm = CharactersViewModel(coordinator: self)
        let vc = CharactersViewController(viewModel: vm)
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    func showCharacterDetails(character: Character) {
        let coordinator = CharacterDetailsCoordinator(childCoordinator: self.childCoordinator, navController: self.navController, character: character)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
