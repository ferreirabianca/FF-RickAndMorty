//
//  Coordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 19/12/23.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navController: UINavigationController { get set }
    
    func start()
    func finish()
    
}
