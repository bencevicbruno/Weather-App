import Foundation

class GeonamesAPIMockupService: GeonamesAPIServiceProtocol {
    
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        DispatchQueue.runOnMainDelayed(5.0) {
            if Int.random(in: 1...10) > 5 {
                let cities = (1...10).map { "City #\($0)" }
                onSuccess(cities)
            } else {
                onFailure?(Failure(error: "Error", message: "This error was forced."))
            }
        }
    }
}
