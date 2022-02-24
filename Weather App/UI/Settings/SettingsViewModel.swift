//
//  SettingsViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

final class SettingsViewModel {
    
    var onDismissed: EmptyCallback?
    
    var useCelsius: Bool
    var showHumidity: Bool
    var showPressure: Bool
    var showWindSpeed: Bool
    
    private let persistenceService: PersistenceServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol) {
        self.persistenceService = persistenceService
        
        let settings = persistenceService.settingsData
        self.useCelsius = settings.useCelsius
        self.showHumidity = settings.showHumidity
        self.showPressure = settings.showPressure
        self.showWindSpeed = settings.showWindSpeed
    }
    
    func dismiss() {
        let newSettingsData = SettingsData(useCelsius: useCelsius, showHumidity: showHumidity, showPressure: showPressure, showWindSpeed: showWindSpeed)
        persistenceService.settingsData = newSettingsData
        onDismissed?()
    }
}
