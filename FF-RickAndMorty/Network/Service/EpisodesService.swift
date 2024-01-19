//
//  EpisodesService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol EpisodesServiceable {
    func getEpisodes(page: Int) async -> Episodes?
    func getEpisode(id: Int) async -> Episode?
}

struct EpisodesService: HTTPClient, EpisodesServiceable {
    func getEpisode(id: Int) async -> Episode? {
        let endpoint = EpisodesEndpoint.episode(id: id)
        do {
            return try await sendRequest(endpoint: endpoint, responseModel: Episode.self)
        } catch {
            return nil
        }
    }
    
    func getEpisodes(page: Int) async -> Episodes? {
        let endpoint = EpisodesEndpoint.episodes(pageNumber: page)
        do {
            return try await sendRequest(endpoint: endpoint, responseModel: Episodes.self)
        } catch {
            return nil
        }
    }
}


