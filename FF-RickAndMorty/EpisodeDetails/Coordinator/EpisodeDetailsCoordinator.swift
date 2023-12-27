//
//  EpisodeDetailsCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class EpisodeDetailsCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    let viewModel = EpisodeDetailsViewModel()
    var episode: Episode?
    
    init(childCoordinator: [Coordinator], navController: UINavigationController, episode: Episode) {
        self.childCoordinator = childCoordinator
        self.navController = navController
        self.episode = episode
    }
    
    func start() {
        let vc = EpisodeDetailsViewController()
        vc.viewModel = viewModel
        vc.viewModel?.coordinator = self
        vc.episode = episode
        
        navController.pushViewController(vc, animated: true)
        
    }
    
    func finish() {}
    
}
