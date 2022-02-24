//
//  WeatherDataService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

final class OpenWeatherAPIService: OpenWeatherAPIServiceProtocol {
    
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    private let dataService: DataServiceProtocol = ServiceFactory.dataService
    
    init() { }
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, completionHandler: @escaping (Result<OpenWeatherAPIResponse, Error>) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
    
    func fetchWeatherData(for location: String, completionHandler: @escaping (Result<OpenWeatherAPIResponse, Error>) -> Void) {
        guard let urlSafeLocationName = location.urlSafe else {
            return completionHandler(.failure(OpenWeatherAPIError.badLocationName))
        }
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeLocationName)&appid=\(apiKey)&units=metric")
        dataService.fetchJSON(from: url, completionHandler: completionHandler)
    }
}
