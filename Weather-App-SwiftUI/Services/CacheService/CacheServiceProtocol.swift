import Foundation

protocol CacheServiceProtocol {
    var previouslySearchedCities: [String] { get set }
    var settings: SettingsData { get set }
    var weatherData: WeatherData? { get set }
    
    var failureHandler: FailureHandler? { get }
    
    func saveSearchScreenData()
    func deleteSearchScreenData()
    
    func saveSettingsData()
    func deleteSettingsData()
    
    func saveHomeScreenData()
    func deleteWeatherData()
}
