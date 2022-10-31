class ServiceFactory {
    static let hasInternetConnection = true
    
    static var geonamesAPIService: GeonamesAPIServiceProtocol {
        Self.hasInternetConnection ? GeonamesAPIService() : GeonamesAPIMockupService()
    }
    
    static var locationService: LocationServiceProtocol {
        LocationService()
    }
    
    static var openWeatherApiService: OpenWeatherAPIServiceProtocol {
        Self.hasInternetConnection ? OpenWeatherAPIService() : OpenWeatherAPIMockupService()
    }
}
