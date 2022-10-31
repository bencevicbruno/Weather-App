import Foundation

struct OpenWeatherAPIResponse: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    struct Weather: Codable {
        let id: Int
    }
    
    struct Main: Codable {
        let temp: Float
        let temp_min: Float
        let temp_max: Float
        let pressure: Float
        let humidity: Float
    }

    struct Wind: Codable {
        let speed: Float
    }
}

extension OpenWeatherAPIResponse {
    static var test: OpenWeatherAPIResponse {
        OpenWeatherAPIResponse(weather: [Weather(id: 800)],
                               main: Main(temp: 21.0, temp_min: 14.5, temp_max: 31.2, pressure: 1016.7, humidity: 79),
                               wind: Wind(speed: 4.34),
                               name: "London")
    }
}
