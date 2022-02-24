//
//  PersistenceService.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

final class PersistenceService: PersistenceServiceProtocol {
    
    var homeData: HomeData? {
        get {
            UserDefaults.standard.load()
        }
        set {
            UserDefaults.standard.save(newValue)
        }
    }
    
    var searchedLocationsData: SearchedLocationsData {
        get {
            UserDefaults.standard.load() ?? SearchedLocationsData.defaultData
        }
        set {
            UserDefaults.standard.save(newValue)
        }
    }
    
    var settingsData: SettingsData {
        get {
            UserDefaults.standard.load() ?? SettingsData.defaultData
        }
        set {
            UserDefaults.standard.save(newValue)
        }
    }
    
    
}
