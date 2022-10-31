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
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.load("homeData")
        }
        set {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.save(newValue, for: "homeData")
        }
    }
    
    var searchedLocationsData: SearchedLocationsData {
        get {
            let data = UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.load("searchData") ?? SearchedLocationsData.defaultData
            let locations = Array(Set(data.locations)).sorted()
            return .init(locations: locations)
        }
        set {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.save(newValue, for: "searchData")
        }
    }
    
    var settingsData: SettingsData {
        get {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.load("settingsData") ?? SettingsData.defaultData
        }
        set {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.save(newValue, for: "settingsData")
        }
    }
    
    var deviceLocation: [Double] {
        get {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.load("deviceLocation") ?? [0, 0]
        }
        set {
            UserDefaults(suiteName: "group.cobeisfresh.weatherapp")!.save(newValue, for: "deviceLocation")
        }
    }
    
    var targetLocation: String?
}
