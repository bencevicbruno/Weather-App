//
//  GeonamesAPIService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/11/21.
//

import Foundation

class GeonamesAPIService: GeonamesAPIServiceProtocol {
    
    private let dataService: DataServiceProtocol
    
    init() {
        self.dataService = DataService()
    }
    
    func fetchCities(prefixedWith prefix: String, completionHandler: @escaping (Result<GeonamesAPIResponse, Error>) -> Void) {
        guard let urlSafePrefix = prefix.urlSafe else {
            return completionHandler(.failure(GeonamesAPIError.badCityPrefix))
        }
        
        let url = URL(string: "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno")
        
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
}
