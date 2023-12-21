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
    var viewModel = CharactersViewModel()
    
    init(childCoordinator: [Coordinator], navController: UINavigationController) {
        self.childCoordinator = childCoordinator
        self.navController = navController
    }
    
    func start() {
        let vc = CharactersViewController()
        vc.viewModel = viewModel
        vc.viewModel?.service = CharactersService()
        vc.viewModel?.coordinator = self
        
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        
    }
}
