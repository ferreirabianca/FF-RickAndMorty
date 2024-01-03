//
//  LoginCoordinator.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 28/12/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navController: UINavigationController
    let viewModel = LoginViewModel()
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.viewModel = viewModel
        vc.viewModel?.service = LoginService()
        vc.viewModel?.coordinator = self
        
        self.navController.pushViewController(vc, animated: true)
    }
    
    func finish() {}
    
    func showHome() {
        let coordinator = HomeCoordinator(childCoordinator: self.childCoordinator, navController: self.navController)
        coordinator.start()
    }
    
    func showError(msg: String) {
        let alert = UIAlertController(title: "Ocorreu um Error", message: msg, preferredStyle: .actionSheet)
        navController.present(alert, animated: true)
    }
}
