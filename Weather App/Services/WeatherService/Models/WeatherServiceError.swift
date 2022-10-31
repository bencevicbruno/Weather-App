//
//  WeatherServiceError.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import Foundation

enum WeatherServiceError: Error {
    case invalidPlaceName(_ place: String)
}
