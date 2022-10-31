//
//  LocationNamesService.swift
//  Weather App
//
//  Created by Bruno Bencevic on 28.10.2022..
//

import Foundation

final class LocationNamesService: LocationNamesServiceProtocol {
    
    @Service private var geonamesAPIService: GeonamesAPIServiceProtocol
    
    init() {}
    
    func fetchCities(prefixedWith prefix: String) async throws -> [String] {
        let response = try await geonamesAPIService.fetchCities(prefixedWith: prefix)
        
        return Array(Set(response.geonames.map { String($0.name) })).sorted()
    }
}
