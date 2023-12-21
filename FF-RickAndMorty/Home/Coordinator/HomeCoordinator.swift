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
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let vc = HomeViewController(service: CharactersService())
        self.navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
}
