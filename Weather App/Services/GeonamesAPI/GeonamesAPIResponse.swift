//
//  GeonamesAPIResponse.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct GeonamesAPIResponse: Codable {
    let geonames: [City]
    
    struct City: Codable {
        let name: String
    }
    
    var locations: [String] {
        Array(Set(geonames.map { $0.name }))
    }
}
