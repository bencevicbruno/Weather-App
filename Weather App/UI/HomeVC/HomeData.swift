//
//  HomeData.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/7/21.
//

import Foundation

struct HomeData {
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
