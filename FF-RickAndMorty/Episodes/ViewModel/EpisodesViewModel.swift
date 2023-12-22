//
//  EpisodesViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import UIKit

class EpisodesViewModel {
    weak var coordinator: EpisodesCoordinator?
    var service: EpisodesServiceable?
    
    func getEpisodes(completion: @escaping (Result<Episodes, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getEpisodes() else {
                return
            }
            completion(result)
        }
    }
}
