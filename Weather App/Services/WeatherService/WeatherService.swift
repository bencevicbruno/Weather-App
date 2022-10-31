//
//  WeatherService.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

final class WeatherService: WeatherServiceProtocol {
    
    @Service private var dataService: DataServiceProtocol
    @Service private var locationService: LocationServiceProtocol
    @Service private var openWeatherAPIService: OpenWeatherAPIServiceProtocol
    
    init() {}
    
    func fetchWeatherData(for coordinates: (Double, Double)) async throws -> HomeData {
        let response = try await openWeatherAPIService.fetchWeatherData(for: coordinates)
        return .init(from: response)
    }
    
    func fetchWeatherData(for place: String) async throws -> HomeData {
        let response = try await openWeatherAPIService.fetchWeatherData(for: place)
        return .init(from: response)
    }

    func fetchWeatherDataForCurrentLocation() async throws -> HomeData {
        let location = await withUnsafeContinuation { [weak self] continuation in
            self?.locationService.fetchLocation { coordinates in
                continuation.resume(returning: (coordinates.latitude, coordinates.longitude))
            }
        }
        
        return try await fetchWeatherData(for: location)
    }
}
