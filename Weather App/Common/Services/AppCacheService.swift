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
    private static let homeDataKey = "homeData"
    
    public var settings = AppCacheService.loadSettings()
    public var cachedHomeData = AppCacheService.loadHomeData()
    
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
    
    func saveHomeData(data: HomeData) {
        guard let data = try? JSONEncoder().encode(data) else { return }
        UserDefaults.standard.set(data, forKey: AppCacheService.homeDataKey)
        UserDefaults.standard.synchronize()
    }
    
    private static func loadHomeData() -> HomeData? {
        guard let data = UserDefaults.standard.object(forKey: homeDataKey) as? Data else { return nil }
        let homeData = try? JSONDecoder().decode(HomeData.self, from: data)
        
        return homeData
    }
}
