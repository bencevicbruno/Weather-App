//
//  AppSettings.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/8/21.
//

import Foundation

class AppCacheService {
    static let instance = AppCacheService()
    
    private static let settingsKey = "settingsData"
    private static let weatherDataKey = "weatherData"
    
    public var settings = AppCacheService.loadSettings()
    
    func saveSettings() {
        guard let data = try? JSONEncoder().encode(settings) else { return }
        UserDefaults.standard.set(data, forKey: AppCacheService.settingsKey)
        UserDefaults.standard.synchronize()
    }
    
    private static func loadSettings() -> SettingsData {
        if let data = UserDefaults.standard.object(forKey: settingsKey) as? Data {
            if let settings = try? JSONDecoder().decode(SettingsData.self, from: data) {
                return settings
            }
        }
        
        return SettingsData.getDefault()
    }
}
