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
    
    init(navController: UINavigationController, viewModel: HomeViewModel = HomeViewModel()) {
//        self.childCoordinator = childCoordinator
        self.navController = navController
        self.viewModel = viewModel
    }
    
    func start() {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        vc.viewModel?.coordinator = self
        
        self.navController.setViewControllers([vc], animated: true)
    }
    
    func finish() {}
    
    func showCharacters() {
        let coordinator = CharactersCoordinator(childCoordinator: self.childCoordinator, navController: self.navController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
    
    func showLocations() {
        let coordinator = LocationsCoordinator(childCoordinator: self.childCoordinator, navController: self.navController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
    
    func showEpisodes() {
        let coordinator = EpisodesCoordinator(childCoordinator: self.childCoordinator, navController: self.navController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
