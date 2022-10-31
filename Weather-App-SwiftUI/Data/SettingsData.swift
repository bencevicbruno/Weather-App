import Foundation

final class SettingsData: ObservableObject {
    @Published var useCelsius: Bool
    @Published var showHumidity: Bool
    @Published var showPressure: Bool
    @Published var showWindSpeed: Bool

    init(useCelsius: Bool, showHumidity: Bool, showPressure: Bool, showWindSpeed: Bool) {
        self.useCelsius = useCelsius
        self.showHumidity = showHumidity
        self.showPressure = showPressure
        self.showWindSpeed = showWindSpeed
    }
    
    init(from state: SettingsViewState) {
        self.useCelsius = state.useCelsius
        self.showHumidity = state.showHumidity
        self.showPressure = state.showPressure
        self.showWindSpeed = state.showWindSpeed
    }
    
    init(copy: SettingsData) {
        self.useCelsius = copy.useCelsius
        self.showHumidity = copy.showHumidity
        self.showPressure = copy.showPressure
        self.showWindSpeed = copy.showWindSpeed
    }
    
    func update(_ newSettingsData: SettingsData) {
        self.useCelsius = newSettingsData.useCelsius
        self.showHumidity = newSettingsData.showHumidity
        self.showPressure = newSettingsData.showPressure
        self.showWindSpeed = newSettingsData.showWindSpeed
    }
    
    static var defaultValue: SettingsData {
        SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWindSpeed: true)
    }
    
    static var sample: SettingsData {
        SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWindSpeed: true)
    }
    
    // MARK: Codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.useCelsius = try container.decode(Bool.self, forKey: .useCelsius)
        self.showHumidity = try container.decode(Bool.self, forKey: .showHumidity)
        self.showPressure = try container.decode(Bool.self, forKey: .showPressure)
        self.showWindSpeed = try container.decode(Bool.self, forKey: .showWindSpeed)
    }
}

extension SettingsData: Codable {
    enum CodingKeys: CodingKey {
        case useCelsius
        case showHumidity
        case showPressure
        case showWindSpeed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.useCelsius, forKey: .useCelsius)
        try container.encode(self.showPressure, forKey: .showHumidity)
        try container.encode(self.showPressure, forKey: .showPressure)
        try container.encode(self.showWindSpeed, forKey: .showWindSpeed)
    }
}
