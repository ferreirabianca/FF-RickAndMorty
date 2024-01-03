//
//  LoginViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 28/12/23.
//

import Foundation

class LoginViewModel {
    weak var coordinator: LoginCoordinator?
    var service: LoginServiceable?
    
    //MARK: - Functions
    func loginTapped(email: String, password: String) {
        self.login(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.coordinator?.showHome()
                case .failure(let failure):
                    self.coordinator?.showError(msg: failure.msg)
                }
            }
        }
    }
    
    //MARK: - Private functions
    private func login(email: String, password: String, completion: @escaping (Result<User, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.userLogin(email: email, password: password) else {
                return
            }
            completion(result)
        }
    }
}
