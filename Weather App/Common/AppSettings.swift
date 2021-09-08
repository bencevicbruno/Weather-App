//
//  AppSettings.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/8/21.
//

import Foundation

class AppSettings {
    private static let SETTINGS_KEY = "settingsData"
    
    static func saveSettings(newSettings: SettingsData) {
        guard let data = try? JSONEncoder().encode(newSettings) else { return }
        UserDefaults.standard.set(data, forKey: SETTINGS_KEY)
        UserDefaults.standard.synchronize()
    }
    
    static func loadSettings() -> SettingsData {
        guard let data = UserDefaults.standard.object(forKey: SETTINGS_KEY) as? Data else { return SettingsData.getDefault() }
        
        do {
            return try JSONDecoder().decode(SettingsData.self, from: data)
        } catch  {
            return SettingsData.getDefault()
        }
    }
}
