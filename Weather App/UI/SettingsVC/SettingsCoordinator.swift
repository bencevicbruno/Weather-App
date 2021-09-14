//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    
    var onExit: EmptyCallback?
    
    func start() -> UIViewController {
        let viewController = createSettingsVC()
        
        return viewController
    }
    
    private func createSettingsVC() -> UIViewController {
        let viewController = SettingsViewController()
        let viewModel = SettingsViewModel()
        
        viewModel.onCelsiusTapped = { [weak viewController, weak viewModel] wasChecked in
            let newState = !wasChecked
            viewModel?.settings.useCelsius = newState
            viewController?.updateView()
        }
        
        viewModel.onFahrenheitTapped = { [weak viewController, weak viewModel] wasChecked in
            let newState = wasChecked
            viewModel?.settings.useCelsius = newState
            viewController?.updateView()
        }
        
        viewModel.onHumidityTapped = { [weak viewController, weak viewModel] wasChecked in
            let newState = !wasChecked
            viewModel?.settings.showHumidity = newState
            viewController?.updateView()
        }
        
        viewModel.onPressureTapped = { [weak viewController, weak viewModel] wasChecked in
            let newState = !wasChecked
            viewModel?.settings.showPressure = newState
            viewController?.updateView()
        }
        
        viewModel.onWindTapped = { [weak viewController, weak viewModel] wasChecked in
            let newState = !wasChecked
            viewModel?.settings.showWind = newState
            viewController?.updateView()
        }
        
        viewModel.onExit = { [weak self, weak viewModel] in
            if let viewModel = viewModel {
                AppCacheService.instance.settings = viewModel.settings
            }
            AppCacheService.instance.saveSettings()
            self?.onExit?()
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
}
