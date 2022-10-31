//
//  LocationNamesServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Bencevic on 28.10.2022..
//

import Foundation

protocol LocationNamesServiceProtocol {
    
    func fetchCities(prefixedWith prefix: String) async throws -> [String]
}
