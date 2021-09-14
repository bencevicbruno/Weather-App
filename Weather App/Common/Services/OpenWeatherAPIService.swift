//
//  WeatherDataService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    struct Weather: Codable {
        let id: Int
    }
    
    struct Main: Codable {
        let temp: Float
        let temp_min: Float
        let temp_max: Float
        let pressure: Float
        let humidity: Float
    }

    struct Wind: Codable {
        let speed: Float
    }
}

class OpenWeatherAPIService {
    static let instance = OpenWeatherAPIService()
    
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    
    func getWeatherData(from coordinates: CLLocationCoordinate2D) -> WeatherData? {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        
        return getWeatherDataFromURL(url)
    }
    
    func getWeatherData(for cityName: String) -> WeatherData? {
        let urlSafeCityName = cityName.replacingOccurrences(of: " ", with: "%20")
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeCityName)&appid=\(apiKey)&units=metric")
        
        return getWeatherDataFromURL(url)
    }
    
    private func getWeatherDataFromURL(_ url: URL?) -> WeatherData? {
        guard let url = url else {
            print("Unable to parse URL")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                return weatherData
            } catch {
                print(error)
                if let recievedData = String(data: data, encoding: .utf8) {
                    print(recievedData)
                }
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
