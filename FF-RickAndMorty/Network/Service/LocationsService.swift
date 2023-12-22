//
//  LocationsService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol LocationsServiceable {
    func getLocations() async -> Result<Locations, RequestError>
}

struct LocationsService: HTTPClient, LocationsServiceable {
    func getLocations() async -> Result<Locations, RequestError> {
        let endpoint = LocationsEndpoint.location
        return await sendRequest(endpoint: endpoint, responseModel: Locations.self)
    }
}
