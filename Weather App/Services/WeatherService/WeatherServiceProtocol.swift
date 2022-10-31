//
//  WeatherServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

protocol WeatherServiceProtocol {
    
    func fetchWeatherData(for coordinates: (Double, Double)) async throws -> HomeData
    func fetchWeatherData(for place: String) async throws -> HomeData
    func fetchWeatherDataForCurrentLocation() async throws -> HomeData
}
