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
    
    func getLocations(completion: @escaping (Result<Locations, RequestError>) -> Void) {
        Task(priority: .background) {
            guard let result = await service?.getLocations() else {
                return
            }
            completion(result)
        }
    }
}
