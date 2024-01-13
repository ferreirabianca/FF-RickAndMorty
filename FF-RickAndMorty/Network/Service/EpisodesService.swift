//
//  EpisodesService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol EpisodesServiceable {
    func getEpisodes(page: Int) async -> Result<Episodes, RequestError>
    func getEpisode(id: Int) async -> Result<Episode, RequestError>
}

struct EpisodesService: HTTPClient, EpisodesServiceable {
    func getEpisode(id: Int) async -> Result<Episode, RequestError> {
        let endpoint = EpisodesEndpoint.episode(id: id)
        return await sendRequest(endpoint: endpoint, responseModel: Episode.self)
    }
    
    func getEpisodes(page: Int) async -> Result<Episodes, RequestError> {
        let endpoint = EpisodesEndpoint.episodes(pageNumber: page)
        return await sendRequest(endpoint: endpoint, responseModel: Episodes.self)
    }
}


