//
//  EpisodesService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol EpisodesServiceable {
    func getEpisodes() async -> Result<Episodes, RequestError>
}

struct EpisodesService: HTTPClient, EpisodesServiceable {
    func getEpisodes() async -> Result<Episodes, RequestError> {
        let endpoint = EpisodesEndpoint.episodes
        return await sendRequest(endpoint: endpoint, responseModel: Episodes.self)
    }
}


