//
//  HomeData.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/7/21.
//

import Foundation

struct HomeData: Codable {
    let condition: String
    let currentTemperature: Int
    let cityName: String
    let minTemperature: Float
    let maxTemperature: Float
    let humidity: Float
    let pressure: Float
    let wind: Float
    
    static func getTest() -> HomeData {
        return HomeData(condition: "sun.max", currentTemperature: 21, cityName: "London", minTemperature: 14.5, maxTemperature: 31.2, humidity: 0.79, pressure: 1016.7, wind: 4.34)
    }
}

extension HomeData {
    init(data: WeatherData) {
        self.condition = HomeData.getConditionFrom(id: data.weather.first?.id ?? 0)
        self.currentTemperature = Int(data.main.temp)
        self.cityName = data.name
        self.minTemperature = data.main.temp_min
        self.maxTemperature = data.main.temp_max
        self.humidity = data.main.humidity
        self.pressure = data.main.pressure
        self.wind = data.wind.speed
    }
    
    private static func getConditionFrom(id: Int) -> String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
