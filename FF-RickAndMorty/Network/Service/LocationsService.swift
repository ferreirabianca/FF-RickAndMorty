//
//  LocationsService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol LocationsServiceable {
    func getLocations(page: Int) async -> Result<Locations, RequestError>
    func getLocation(id: Int) async -> Result<Location, RequestError>
}

struct LocationsService: HTTPClient, LocationsServiceable {
    func getLocation(id: Int) async -> Result<Location, RequestError> {
        let endpoint = LocationsEndpoint.location(id: id)
        return await sendRequest(endpoint: endpoint, responseModel: Location.self)
    }
    
    func getLocations(page: Int) async -> Result<Locations, RequestError> {
        let endpoint = LocationsEndpoint.locations(pageNumber: page)
        return await sendRequest(endpoint: endpoint, responseModel: Locations.self)
    }
}
