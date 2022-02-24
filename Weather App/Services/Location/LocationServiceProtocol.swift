//
//  LocationServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol {
    
    typealias LocationConsumer = (CLLocationCoordinate2D) -> Void
    
    func fetchLocation(_ consumer: @escaping LocationConsumer)
}
