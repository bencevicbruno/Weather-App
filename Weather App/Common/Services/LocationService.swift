//
//  LocationService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

class LocationSerivce: NSObject, CLLocationManagerDelegate {
    typealias LocationConsumer = (CLLocationCoordinate2D) -> Void
    
    static let instance = LocationSerivce()
    
    private lazy var locationManager = CLLocationManager()
    private var locationConsumers = [LocationConsumer]()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationData(thenRun consumer: @escaping LocationConsumer) {
        locationConsumers.append(consumer)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationConsumers.forEach { consumer in
                consumer(location.coordinate)
            }
            locationConsumers.removeAll()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
