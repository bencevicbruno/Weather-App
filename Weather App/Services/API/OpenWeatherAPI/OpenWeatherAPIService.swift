//
//  WeatherDataService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

final class OpenWeatherAPIService: OpenWeatherAPIServiceProtocol {
    
    @Service private var dataService: DataServiceProtocol
    
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    
    init() { }
    
    func fetchWeatherData(for coordinates: (Double, Double)) async throws -> OpenWeatherAPIResponse {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.0)&lon=\(coordinates.1)&appid=\(apiKey)&units=metric"
        
        return try await dataService.fetchJSON(at: url)
    }
    
    func fetchWeatherData(for location: String) async throws -> OpenWeatherAPIResponse {
        guard let urlSafeLocation = location.urlSafe else {
            throw OpenWeatherAPIError.badLocationName(location)
        }
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeLocation)&appid=\(apiKey)&units=metric"
        
        return try await dataService.fetchJSON(at: url)
    }
}
