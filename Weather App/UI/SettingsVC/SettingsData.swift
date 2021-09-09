//
//  SettingsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/7/21.
//

import Foundation

struct SettingsData: Codable {
    var useCelsius: Bool?
    var showHumidity: Bool?
    var showPressure: Bool?
    var showWind: Bool?
    
    init(useCelsius: Bool? = nil, showHumidity: Bool? = nil, showPressure: Bool? = nil, showWind: Bool? = nil) {
        self.useCelsius = useCelsius
        self.showHumidity = showHumidity
        self.showPressure = showPressure
        self.showWind = showWind
    }
    
    static func getDefault() -> SettingsData {
        return SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWind: true)
    }
}
