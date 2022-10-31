//
//  OpenWeatherAPIService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/7/21.
//

import Foundation
import CoreLocation

class OpenWeatherAPIService: OpenWeatherAPIServiceProtocol {
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        let url = URL(string: "htts://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        
        fetchWeatherData(from: url, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        let urlSafeCityName = cityName.toURLSafe()
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeCityName)&appid=\(apiKey)&units=metric")
        
        fetchWeatherData(from: url, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    private func fetchWeatherData(from url: URL?, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        DispatchQueue.runInBackground {
            guard let url = url else {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Bad URL", message: "Invalid URL created for OpenWeatherAPI request!"))
                }
                return
            }
            
            let data: Data
            do {
                data = try Data(contentsOf: url)
            } catch {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Error fetching data", message: error.localizedDescription))
                }
                return
            }
            
            let response: OpenWeatherAPIResponse
            do {
                response = try JSONDecoder().decode(OpenWeatherAPIResponse.self, from: data)
            } catch {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Error parsing JSON response", message: error.localizedDescription))
                }
                return
            }
            
            DispatchQueue.runOnMain {
                onSuccess(response)
            }
        }
    }
}
