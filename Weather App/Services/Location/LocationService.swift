//
//  LocationService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

final class LocationSerivce: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    
    static let instance = LocationSerivce()
    
    private var locationConsumers = [LocationConsumer]()
    private lazy var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchLocation(_ consumer: @escaping (CLLocationCoordinate2D) -> Void) {
        locationConsumers.append(consumer)

        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationConsumers.forEach { consumer in
                consumer(location.coordinate)
            }
            locationConsumers.removeAll()
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error location: \(error)")
    }
}
