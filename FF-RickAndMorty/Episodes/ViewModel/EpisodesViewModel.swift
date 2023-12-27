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
    
    func gotoEpisodeDetails(with episode: Episode) {
        coordinator?.gotoEpisodeDetails(episode: episode)
    }
    
    func getEpisode(id: Int, completion: @escaping (Result<Episode, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getEpisode(id: id) else {
                return
            }
            completion(result)
        }
    }
    
    func getEpisodes(completion: @escaping (Result<Episodes, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getEpisodes() else {
                return
            }
            completion(result)
        }
    }
}
