//
//  SettingsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/7/21.
//

import Foundation

struct SettingsData: Codable {
    var useCelsius: Bool
    var showHumidity: Bool
    var showPressure: Bool
    var showWind: Bool
    
    static func getDefault() -> SettingsData {
        return SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWind: true)
    }
}
