//
//  HomeCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class WeatherCoordinator: Coordinator {
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        navigationController.pushViewController(vc, animated: true)
        
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = WeatherViewController()
        vc.viewModel = WeatherViewModel()
        
        vc.viewModel.onGoToSearchScreen = { [weak self] in
            self?.createSearchVC()
        }
        
        vc.viewModel.onGoToSettingsScreen = { [weak self] in
            self?.createSettingsVC()
        }
        
        return vc
    }
    
    private func createSearchVC() {
        showAlert("Implement navigation to SearchVC")
//        let vc = SearchViewController()
//        vc.viewModel = SearchViewModel()
//
//        vc.viewModel - setupCallbacks()
//
//        navigationController.pushViewController(vc, animated: true)
    }
    
    private func createSettingsVC() {
        showAlert("Implement navigation to SettingsVC")
//        let vc = SettingsViewController()
//        vc.viewModel = SettingsViewModel()
//
//        vc.viewModel - setupCallbacks()
//
//        navigationController.pushViewController(vc, animated: true)
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "TODO:", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        navigationController.present(alert, animated: true)
    }
}
