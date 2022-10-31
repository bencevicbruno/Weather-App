//
//  OpenWeatherAPIResponse.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct OpenWeatherAPIResponse: Codable {
    
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
