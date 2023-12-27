//
//  EpisodesCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit

class EpisodesCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    var viewModel = EpisodesViewModel()
    
    init(childCoordinator: [Coordinator], navController: UINavigationController) {
        self.childCoordinator = childCoordinator
        self.navController = navController
    }
    
    func start() {
        let vc = EpisodesViewController()
        vc.viewModel = viewModel
        vc.viewModel?.service = EpisodesService()
        vc.viewModel?.coordinator = self
        
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    func gotoEpisodeDetails(episode: Episode) {
        let coordinator = EpisodeDetailsCoordinator(childCoordinator: self.childCoordinator, navController: self.navController, episode: episode)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
