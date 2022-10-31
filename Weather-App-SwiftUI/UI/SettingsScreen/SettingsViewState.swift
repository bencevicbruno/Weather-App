import SwiftUI

class SettingsViewState: ObservableObject {
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
    
    init(from settingsData: SettingsData) {
        self.useCelsius = settingsData.useCelsius
        self.showHumidity = settingsData.showHumidity
        self.showPressure = settingsData.showPressure
        self.showWindSpeed = settingsData.showWindSpeed
    }
    
    static var test: SettingsViewState {
        SettingsViewState(useCelsius: true, showHumidity: true, showPressure: false, showWindSpeed: true)
    }
}
