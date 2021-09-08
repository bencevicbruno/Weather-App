//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    var settingsData: SettingsData?
    
    func start() -> UIViewController {
        let viewController = createSettingsVC()
        
        return viewController
    }
    
    private func createSettingsVC() -> UIViewController {
        let viewController = SettingsViewController()
        let viewModel = SettingsViewModel()
        
        settingsData = AppSettings.loadSettings()
        viewController.updateView(data: settingsData!)
        
        viewModel.onCelsiusTapped = { [weak self] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(useCelsius: newState)
            
            viewController.updateView(data: newSettings)
            self?.settingsData?.useCelsius = newState
        }
        
        viewModel.onFahrenheitTapped = { [weak self] wasChecked in
            let newState = wasChecked
            let newSettings = SettingsData(useCelsius: newState)
            
            viewController.updateView(data: newSettings)
            self?.settingsData?.useCelsius = newState
        }
        
        viewModel.onHumidityTapped = { [weak self] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showHumidity: newState)
            
            viewController.updateView(data: newSettings)
            self?.settingsData?.showHumidity = newState
        }
        
        viewModel.onPressureTapped = { [weak self] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showPressure: newState)
            
            viewController.updateView(data: newSettings)
            self?.settingsData?.showPressure = newState
        }
        
        viewModel.onWindTapped = { [weak self] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showWind: newState)
            
            viewController.updateView(data: newSettings)
            self?.settingsData?.showWind = newState
        }
        
        viewModel.onExit = { [weak self] in
            guard let data = try? JSONEncoder().encode(self?.settingsData) else { return }
            UserDefaults.standard.set(data, forKey: "settingsData")
            UserDefaults.standard.synchronize()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
}
