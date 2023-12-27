//
//  LocationsCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit

class LocationsCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    var viewModel = LocationsViewModel()
    
    init(childCoordinator: [Coordinator], navController: UINavigationController) {
        self.childCoordinator = childCoordinator
        self.navController = navController
    }
    
    func start() {
        let vc = LocationsViewController()
        vc.viewModel = viewModel
        vc.viewModel?.service = LocationsService()
        vc.viewModel?.coordinator = self
        
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    func showLocationDetails(location: Location) {
        let coordinator = LocationDetailsCoordinator(childCoordinator: self.childCoordinator, navController: self.navController, location: location)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
