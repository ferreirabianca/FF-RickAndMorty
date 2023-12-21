//
//  HomeCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 19/12/23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navController: UINavigationController
    var viewModel = HomeViewModel()
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        vc.viewModel?.coordinator = self
        
        self.navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    func showCharacters() {
        let coordinator = CharactersCoordinator(childCoordinator: self.childCoordinator, navController: self.navController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
