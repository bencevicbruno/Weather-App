import CoreLocation

class LocationRequest {
    typealias LocationHandler = (CLLocationCoordinate2D) -> Void
    
    var locationHandler: LocationHandler
    var failureHandler: FailureHandler?
    
    init(_ locationHandler: @escaping LocationHandler, failureHandler: FailureHandler? = nil) {
        self.locationHandler = locationHandler
        self.failureHandler = failureHandler
    }
}
