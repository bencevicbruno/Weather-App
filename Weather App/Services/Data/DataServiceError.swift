//
//  DataServiceError.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

enum DataServiceError: Error {
    case badURL
    case noInternet
    case badJSON
}
