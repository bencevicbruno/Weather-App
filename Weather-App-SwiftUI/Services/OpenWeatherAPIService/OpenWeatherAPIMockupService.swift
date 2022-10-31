import Foundation
import CoreLocation

class OpenWeatherAPIMockupService: OpenWeatherAPIServiceProtocol {
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        onSuccess(OpenWeatherAPIResponse.test)
    }
    
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if Int.random(in: 1...10) > 5 {
                onSuccess(OpenWeatherAPIResponse.test)
            } else {
                onFailure?(Failure(error: "Error fetching data", message: "This error was forcefully returned."))
            }
        }
    }
}
