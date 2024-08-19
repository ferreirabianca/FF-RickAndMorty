//
//  LoginService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 28/12/23.
//

import Foundation

//protocol LoginServiceable {
//    func userLogin(email: String, password: String) async -> Result<User, RequestError>
//}

//struct LoginService: HTTPClient, LoginServiceable {
//    func userLogin(email: String, password: String) async -> Result<User, RequestError> {
//        let endpoint = LoginEndpoint.login(email: email, password: password)
//        return await sendRequest(endpoint: endpoint, responseModel: User.self)
//    }
//}


struct User: Decodable {
    let msg: String
    let token: String
}
