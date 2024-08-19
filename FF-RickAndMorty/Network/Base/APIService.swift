//
//  APIService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 07/08/24.
//

import Foundation
import RxSwift
import Alamofire

typealias Parameters = [String: Any]

protocol Request {
    func makeRequest<T: Decodable>(_ url: URL, _ method: HTTPMethod) -> Single<T>
}

class APIService: Request {
    func makeRequest<T: Decodable>(_ url: URL, _ method: Alamofire.HTTPMethod) -> Single<T> {
        return Single.create { single in
            let request = AF.request(url, method: method)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        single(.success(data))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            return Disposables.create { request.cancel() }
        }
    }
}
