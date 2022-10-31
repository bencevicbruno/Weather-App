//
//  GeonamesAPIServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

protocol GeonamesAPIServiceProtocol: AnyObject {
    
    func fetchCities(prefixedWith prefix: String) async throws -> GeonamesAPIResponse
}
