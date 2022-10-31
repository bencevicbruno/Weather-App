import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    private lazy var locationManager = CLLocationManager()
    private var locationRequests = [LocationRequest]()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation(_ request: LocationRequest) {
        locationRequests.append(request)
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationRequests.forEach { request in
                request.locationHandler(location.coordinate)
            }
            locationRequests.removeAll()
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationRequests.forEach { request in
            request.failureHandler?(Failure(error: "Location Service Error", message: "Unable to retrieve location."))
        }
        locationRequests.removeAll()
        locationManager.stopUpdatingLocation()
    }
}
