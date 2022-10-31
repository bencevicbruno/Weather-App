import Foundation

class CacheService: CacheServiceProtocol {
    static var instance = CacheService(onFailure: { print("\($0.error): \($0.message)") })
    
    private var userDefauts = UserDefaults.standard
    internal var failureHandler: FailureHandler?
    
    var previouslySearchedCities: [String] {
        didSet {
            self.saveSearchScreenData()
        }
    }
    
    var settings: SettingsData {
        didSet {
            self.saveSettingsData()
        }
    }
    
    var weatherData: WeatherData? {
        didSet {
            self.saveHomeScreenData()
        }
    }
    
    init(onFailure: FailureHandler? = nil) {
        self.failureHandler = onFailure
        
        self.weatherData = userDefauts.load(WeatherData?.self, key: Self.weatherDataKey, defaultValue: nil, onFailure: self.failureHandler)
        self.previouslySearchedCities = userDefauts.load([String].self, key: Self.previouslySearchedCitiesKey, defaultValue: [], onFailure: self.failureHandler)
        self.settings = userDefauts.load(SettingsData.self, key: Self.settingsKey, defaultValue: SettingsData.defaultValue, onFailure: self.failureHandler)
    }
    
    // MARK: HomeScreenData
    
    internal func saveHomeScreenData() {
        userDefauts.save(self.weatherData, key: Self.weatherDataKey, onFailure: self.failureHandler)
    }
    
    func deleteWeatherData() {
        userDefauts.removeObject(forKey: Self.weatherDataKey)
    }
    
    // MARK: PreviouslySearchedCitiesKey
    internal func saveSearchScreenData() {
        userDefauts.save(self.previouslySearchedCities, key: Self.previouslySearchedCitiesKey, onFailure: self.failureHandler)
    }
    
    func deleteSearchScreenData() {
        userDefauts.removeObject(forKey: Self.previouslySearchedCitiesKey)
    }
    
    // MARK: SettingsData
    internal func saveSettingsData() {
        userDefauts.save(self.settings, key: Self.settingsKey, onFailure: self.failureHandler)
    }
    
    func deleteSettingsData() {
        userDefauts.removeObject(forKey: Self.settingsKey)
    }
    
    private static let settingsKey = "settingsKey"
    private static let previouslySearchedCitiesKey = "previouslySearchedCities"
    private static let
        weatherDataKey = "weatherDataKey"
}
