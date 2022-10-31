import Foundation
import CoreLocation

protocol OpenWeatherAPIServiceProtocol {
    typealias SuccessHandler = (OpenWeatherAPIResponse) -> Void
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
}
