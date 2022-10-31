//
//  SearchedLocationsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct SearchedLocationsData: Codable {
    var locations: [String]
    
    static var defaultData: Self {
        SearchedLocationsData(locations: [])
    }
    
    mutating func append(_ newLocation: String) {
        locations.append(newLocation)
    }
}

extension SearchedLocationsData {
    
    init(data: GeonamesAPIResponse) {
        self.locations = data.geonames.map { $0.name }
    }
}
