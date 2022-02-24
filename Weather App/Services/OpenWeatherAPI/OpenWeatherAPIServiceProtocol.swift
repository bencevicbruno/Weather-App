//
//  OpenWeatherAPIServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation
import CoreLocation

protocol OpenWeatherAPIServiceProtocol: AnyObject {
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, completionHandler: @escaping (Result<OpenWeatherAPIResponse, Error>) -> Void)
    func fetchWeatherData(for location: String, completionHandler: @escaping (Result<OpenWeatherAPIResponse, Error>) -> Void) 
}
