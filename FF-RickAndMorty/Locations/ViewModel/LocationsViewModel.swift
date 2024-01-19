//
//  LocationsViewModel.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 22/12/23.
//

import Foundation

class LocationsViewModel {
    weak var coordinator: LocationsCoordinator?
    var service: LocationsServiceable?
    
    func gotoLocationDetails(with location: Location) {
        coordinator?.showLocationDetails(location: location)
    }
    
    func getLocations(pageNumber: Int) async -> [Location]? {
        guard let locations = await service?.getLocations(page: pageNumber) else {
            return nil
        }
        return locations.results
    }
    
    func getLocations(pageNumber: Int, completion: @escaping ([Location]) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getLocations(page: pageNumber) else {
                return
            }
            completion(result.results)
        }
    }
    
    func getLocation(id: Int, completion: @escaping (Location) -> Void) {
        Task(priority: .background) {
            guard let result = await self.service?.getLocation(id: id) else {
                return
            }
            completion(result)
        }
    }
}
