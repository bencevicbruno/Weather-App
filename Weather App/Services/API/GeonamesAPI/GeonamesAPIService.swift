//
//  GeonamesAPIService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/11/21.
//

import Foundation

final class GeonamesAPIService: GeonamesAPIServiceProtocol {
    
    @Service private var dataService: DataServiceProtocol
    
    init() {}
    
    func fetchCities(prefixedWith prefix: String) async throws -> GeonamesAPIResponse {
        guard let urlSafePrefix = prefix.urlSafe else {
            throw GeonamesAPIError.badCityPrefix(prefix)
        }
        
        let url = "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno"
        
        return try await dataService.fetchJSON(at: url)
    }
}
