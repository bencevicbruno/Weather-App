//
//  OpenWeatherAPIServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation
import CoreLocation

protocol OpenWeatherAPIServiceProtocol: AnyObject {
    
    func fetchWeatherData(for coordinates: (Double, Double)) async throws -> OpenWeatherAPIResponse
    func fetchWeatherData(for location: String) async throws -> OpenWeatherAPIResponse
}
