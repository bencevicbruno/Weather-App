//
//  LocationService.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/9/21.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, LocationServiceProtocol {
    
    private var locationConsumers = [LocationConsumer]()
    private lazy var locationManager = CLLocationManager()
    
    @Service private var persistenceService: PersistenceServiceProtocol
    
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
}

extension LocationService: CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationConsumers.forEach { consumer in
                consumer(location.coordinate)
            }
            persistenceService.deviceLocation = [ location.coordinate.latitude, location.coordinate.longitude ]
            locationConsumers.removeAll()
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error location: \(error)")
    }
}
