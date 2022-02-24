//
//  SearchedLocationsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct SearchedLocationsData: Codable {
    let locations: [String]
    
    static var defaultData: Self {
        SearchedLocationsData(locations: [])
    }
}

extension SearchedLocationsData {
    
    init(data: GeonamesAPIResponse) {
        self.locations = data.geonames.map { $0.name }
    }
}
