import Foundation

class GeonamesAPIService: GeonamesAPIServiceProtocol {
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        DispatchQueue.runInBackground {
            let urlSafePrefix = prefix.lowercased().toURLSafe()
            
            guard let url = URL(string: "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno") else {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Invalid city name",
                                       message: "Make sure your city name doesn't!"))
                }
                return
            }
            
            let data: Data
            do {
                data = try Data(contentsOf: url)
            } catch {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Error fetching data", message: error.localizedDescription))
                }
                return
            }
            
            let response: GeonamesAPIResponse
            do {
                response = try JSONDecoder().decode(GeonamesAPIResponse.self, from: data)
            } catch {
                DispatchQueue.runOnMain {
                    onFailure?(Failure(error: "Error parsing JSON response", message: error.localizedDescription))
                }
                return
            }
            
            let cityNames = response.geonames.map { $0.name }
            let cities = Array(Set(cityNames)).sorted()
            DispatchQueue.runOnMain {
                onSuccess(cities)
            }
        }
    }
}
