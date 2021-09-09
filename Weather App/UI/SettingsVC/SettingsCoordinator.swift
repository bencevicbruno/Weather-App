//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    func start() -> UIViewController {
        let viewController = createSettingsVC()
        
        return viewController
    }
    
    private func createSettingsVC() -> UIViewController {
        let viewController = SettingsViewController()
        let viewModel = SettingsViewModel()
        
        viewModel.onCelsiusTapped = { [weak viewModel] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(useCelsius: newState)
            
            viewController.updateView(data: newSettings)
            viewModel?.settingsData.useCelsius = newState
        }
        
        viewModel.onFahrenheitTapped = { [weak viewModel] wasChecked in
            let newState = wasChecked
            let newSettings = SettingsData(useCelsius: newState)
            
            viewController.updateView(data: newSettings)
            viewModel?.settingsData.useCelsius = newState
        }
        
        viewModel.onHumidityTapped = { [weak viewModel] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showHumidity: newState)
            
            viewController.updateView(data: newSettings)
            viewModel?.settingsData.showHumidity = newState
        }
        
        viewModel.onPressureTapped = { [weak viewModel] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showPressure: newState)
            
            viewController.updateView(data: newSettings)
            viewModel?.settingsData.showPressure = newState
        }
        
        viewModel.onWindTapped = { [weak viewModel] wasChecked in
            let newState = !wasChecked
            let newSettings = SettingsData(showWind: newState)
            
            viewController.updateView(data: newSettings)
            viewModel?.settingsData.showWind = newState
        }
        
        viewModel.onExit = { [weak viewModel] in
            guard let data = try? JSONEncoder().encode(viewModel?.settingsData) else { return }
            UserDefaults.standard.set(data, forKey: "settingsData")
            UserDefaults.standard.synchronize()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
}
