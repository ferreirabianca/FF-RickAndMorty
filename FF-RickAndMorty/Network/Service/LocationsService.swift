//
//  LocationsService.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

protocol LocationsServiceable {
    func getLocations(page: Int) async -> Locations?
    func getLocation(id: Int) async -> Location?
}

struct LocationsService: HTTPClient, LocationsServiceable {
    func getLocation(id: Int) async -> Location? {
//        let endpoint = LocationsEndpoint.location(id: id)
//        do {
//            return try await sendRequest(endpoint: endpoint, responseModel: Location.self)
//        } catch {
//            return nil
//        }
        return nil
    }
    
    func getLocations(page: Int) async -> Locations? {
//        let endpoint = LocationsEndpoint.locations(pageNumber: page)
//        do {
//            return try await sendRequest(endpoint: endpoint, responseModel: Locations.self)
//        } catch {
//            return nil
//        }
        return nil
        
    }
}
