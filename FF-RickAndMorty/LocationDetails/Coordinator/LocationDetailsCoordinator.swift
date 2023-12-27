//
//  LocationDetailsCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 26/12/23.
//

import UIKit

class LocationDetailsCoordinator: Coordinator {
    var childCoordinator: [Coordinator]
    var navController: UINavigationController
    let viewModel = LocationDetailsViewModel()
    var location: Location?
    
    init(childCoordinator: [Coordinator], navController: UINavigationController, location: Location) {
        self.childCoordinator = childCoordinator
        self.navController = navController
        self.location = location
    }
    
    func start() {
        let vc = LocationDetailsViewController()
        vc.location = location
        vc.viewModel = viewModel
        vc.viewModel?.coordinator = self
        
        navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
}
