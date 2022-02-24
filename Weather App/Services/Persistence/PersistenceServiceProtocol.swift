//
//  PersistenceServiceProtocol.swift
//  Weather App
//
//  Created by Bruno Benčević on 23.02.2022..
//

import Foundation

protocol PersistenceServiceProtocol: AnyObject {
    
    var homeData: HomeData? { get set }
    var searchedLocationsData: SearchedLocationsData { get set }
    var settingsData: SettingsData { get set }
}
