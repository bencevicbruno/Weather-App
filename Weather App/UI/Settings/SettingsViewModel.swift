//
//  SettingsViewModel.swift
//  Weather App
//
//  Created by Bruno Bencevic on 13.10.2022..
//

import Foundation

final class SettingsViewModel {
    
    var onDismissed: (() -> Void)?
    var onUpdateView: ((SettingsData) -> Void)?
    
    @Service private var persistenceService: PersistenceServiceProtocol
    
    init() {
    }
    
    func updateUseCelsius(_ shouldUseCelsius: Bool) {
        let newSettingData = persistenceService.settingsData.overrideUseCelsius(shouldUseCelsius)
        persistenceService.settingsData = newSettingData
        onUpdateView?(newSettingData)
    }
    
    func updateShowWindspeed(_ shouldShowWindSpeed: Bool) {
        let newSettingData = persistenceService.settingsData.overrideShowWindSpeed(shouldShowWindSpeed)
        persistenceService.settingsData = newSettingData
        onUpdateView?(newSettingData)
    }
    
    func updateShowPressure(_ shouldShowPressure: Bool) {
        let newSettingData = persistenceService.settingsData.overrideShowPressure(shouldShowPressure)
        persistenceService.settingsData = newSettingData
        onUpdateView?(newSettingData)
    }
    
    func updateShowHumidity(_ shouldShowHumidity: Bool) {
        let newSettingData = persistenceService.settingsData.overrideShowHumidity(shouldShowHumidity)
        persistenceService.settingsData = newSettingData
        onUpdateView?(newSettingData)
    }
    
    func dismiss() {
        onDismissed?()
    }
}
