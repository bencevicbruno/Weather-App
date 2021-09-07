//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    var settingsData: SettingsData!
    
    func start() -> UIViewController {
        let viewController = createSettingsVC()
        
        return viewController
    }
    
    private func createSettingsVC() -> UIViewController {
        let viewController = SettingsViewController()
        let viewModel = SettingsViewModel()
        
        viewModel.onEnter = { [weak self] in
            if let loadedData = self?.loadSettingsData() {
                viewController.settingsView.setupData(data: loadedData)
                self?.settingsData = loadedData
            }
        }
        
        viewModel.onCelsiusTapped = { [weak self] wasChecked in
            viewController.settingsView.setCelsiusButtonChecked(!wasChecked)
            viewController.settingsView.setFahrenheitButtonChecked(wasChecked)
            self?.settingsData.useCelsius = true
        }
        
        viewModel.onFahrenheitTapped = { [weak self] wasChecked in
            viewController.settingsView.setFahrenheitButtonChecked(!wasChecked)
            viewController.settingsView.setCelsiusButtonChecked(wasChecked)
            self?.settingsData.useCelsius = false
        }
        
        viewModel.onHumidityTapped = { [weak self] wasChecked in
            viewController.settingsView.setHumidityButtonChecked(!wasChecked)
            self?.settingsData.showHumidity = !wasChecked
        }
        
        viewModel.onPressureTapped = { [weak self] wasChecked in
            viewController.settingsView.setPressureButtonChecked(!wasChecked)
            self?.settingsData.showPressure = !wasChecked
        }
        
        viewModel.onWindTapped = { [weak self] wasChecked in
            viewController.settingsView.setWindButtonChecked(!wasChecked)
            self?.settingsData.showWind = !wasChecked
        }
        
        viewModel.onExit = { [weak self] in
            guard let data = try? JSONEncoder().encode(self?.settingsData) else { return }
            UserDefaults.standard.set(data, forKey: "settingsData")
            UserDefaults.standard.synchronize()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func loadSettingsData() -> SettingsData {
        guard let data = UserDefaults.standard.object(forKey: "settingsData") as? Data else { return SettingsData.getDefault() }
        
        do {
            return try JSONDecoder().decode(SettingsData.self, from: data)
        } catch  {
            return SettingsData.getDefault()
        }
    }
}
