import Foundation

final class WeatherData: ObservableObject {
    @Published var weatherIcon: String
    @Published var currentTemperature: Int
    @Published var location: String
    @Published var minimalTemperature: Float
    @Published var maximalTemperature: Float
    @Published var humidity: Float
    @Published var pressure: Float
    @Published var windSpeed: Float
    
    init(weatherIcon: String, currentTemperature: Int, location: String, minimalTemperature: Float, maximalTemperature: Float, humidity: Float, pressure: Float, windSpeed: Float) {
        self.weatherIcon = weatherIcon
        self.currentTemperature = currentTemperature
        self.location = location
        self.minimalTemperature = minimalTemperature
        self.maximalTemperature = maximalTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.weatherIcon = try container.decode(String.self, forKey: .weatherIcon)
        self.currentTemperature = try container.decode(Int.self, forKey: .currentTemperature)
        self.location = try container.decode(String.self, forKey: .location)
        self.minimalTemperature = try container.decode(Float.self, forKey: .minimalTemperature)
        self.maximalTemperature = try container.decode(Float.self, forKey: .maximalTemperature)
        self.humidity = try container.decode(Float.self, forKey: .humidity)
        self.pressure = try container.decode(Float.self, forKey: .pressure)
        self.windSpeed = try container.decode(Float.self, forKey: .windSpeed)
    }
}

extension WeatherData: Codable {
    enum CodingKeys: CodingKey {
        case weatherIcon
        case currentTemperature
        case location
        case minimalTemperature
        case maximalTemperature
        case humidity
        case pressure
        case windSpeed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.weatherIcon, forKey: .weatherIcon)
        try container.encode(self.currentTemperature, forKey: .currentTemperature)
        try container.encode(self.location, forKey: .location)
        try container.encode(self.minimalTemperature, forKey: .minimalTemperature)
        try container.encode(self.maximalTemperature, forKey: .maximalTemperature)
        try container.encode(self.humidity, forKey: .humidity)
        try container.encode(self.pressure, forKey: .pressure)
        try container.encode(self.windSpeed, forKey: .windSpeed)
    }
}

extension WeatherData {
    convenience init(response: OpenWeatherAPIResponse) {
        self.init(weatherIcon: Self.getWeatherIcon(from: response.weather.first?.id ?? 0),
                  currentTemperature: Int(response.main.temp),
                  location: response.name,
                  minimalTemperature: response.main.temp_min,
                  maximalTemperature: response.main.temp_max,
                  humidity: response.main.humidity / 100,
                  pressure: response.main.pressure,
                  windSpeed: response.wind.speed)
    }
    
    private static func getWeatherIcon(from id: Int) -> String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

extension WeatherData {
    static var test: WeatherData {
        WeatherData(weatherIcon: "sun.max", currentTemperature: 21, location: "London", minimalTemperature: 14.5, maximalTemperature: 31.2, humidity: 0.79, pressure: 1016.7, windSpeed: 4.34)
    }
}
