//
//  LoginEndpoint.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 28/12/23.
//

import Foundation

enum LoginEndpoint {
    case login(email: String, password: String)
}

extension LoginEndpoint: Endpoint {
    var scheme: String {
        return "http://"
    }
    
    var host: String {
        return "192.168.18.69:3000"
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        }
    }
    
    var method: RequestMethod {
        .post
    }
    
    var header: [String : String]? {
        let params: [String: String] = [
            "Content-Type": "application/json"
        ]
        return params
    }
    
    var body: [String : String]? {
        switch self {
        case .login(let email, let password):
            let params: [String: String] = [
                "email": email,
                "password": password
            ]
            return params
        }
    }
}
