//
//  HomeCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class WeatherCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let vc = createHomeVC()
        
        let navigationController = UINavigationController(rootViewController: vc)
        self.navigationController = navigationController
        
        return navigationController
    }
    
    private func createHomeVC() -> UIViewController {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        
        vc.viewModel.onGoToSearchScreen = { [weak self] in
            self?.goToSearchScreen()
        }
        
        vc.viewModel.onGoToSettingsScreen = { [weak self] in
            self?.goToSettingsScreen()
        }
        
        return vc
    }
    
    private func goToSearchScreen() {
        let searchCoordinator = SearchCoordinator()
        childCoordinator = searchCoordinator
        
        let rootVC = searchCoordinator.start()
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
    
    private func goToSettingsScreen() {
        let settingsCoordinator = SettingsCoordinator()
        childCoordinator = settingsCoordinator
        
        let rootVC = settingsCoordinator.start()
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}
