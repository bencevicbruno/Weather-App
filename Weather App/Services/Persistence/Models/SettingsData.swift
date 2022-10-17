//
//  SettingsData.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

struct SettingsData: Codable {
    let useCelsius: Bool
    let showHumidity: Bool
    let showPressure: Bool
    let showWindSpeed: Bool
    
    static var defaultData: SettingsData {
        SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWindSpeed: true)
    }
    
    func overrideUseCelsius(_ bool: Bool) -> SettingsData {
        SettingsData(useCelsius: bool, showHumidity: self.showHumidity, showPressure: self.showPressure, showWindSpeed: self.showWindSpeed)
    }
    
    func overrideShowHumidity(_ bool: Bool) -> SettingsData {
        SettingsData(useCelsius: self.useCelsius, showHumidity: bool, showPressure: self.showPressure, showWindSpeed: self.showWindSpeed)
    }
    
    func overrideShowPressure(_ bool: Bool) -> SettingsData {
        SettingsData(useCelsius: self.useCelsius, showHumidity: self.showHumidity, showPressure: bool, showWindSpeed: self.showWindSpeed)
    }
    
    func overrideShowWindSpeed(_ bool: Bool) -> SettingsData {
        SettingsData(useCelsius: self.useCelsius, showHumidity: self.showHumidity, showPressure: self.showPressure, showWindSpeed: bool)
    }
}
