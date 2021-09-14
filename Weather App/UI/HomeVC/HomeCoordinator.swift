//
//  HomeCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let viewController = createHomeViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        return navigationController
    }
    
    private func createHomeViewController() -> UIViewController {
        let viewController = HomeViewController()
        let viewModel = HomeViewModel()
        
        viewModel.onGoToSearchScreen = { [weak self, weak viewModel] in
            self?.goToSearchScreen(onExit: { selectedCityName in
                if let weatherData = OpenWeatherAPIService.init().getWeatherData(for: selectedCityName) {
                    viewModel?.homeData = HomeData(data: weatherData)
                    viewModel?.updateData?()
                }
            })
        }
        
        viewModel.onGoToSettingsScreen = { [weak self, weak viewModel] in
            self?.goToSettingsScreen(onExit: {
                viewModel?.updateData?()
            })
        }
        
        viewModel.updateData = { [weak viewModel] in
            guard let homeData = viewModel?.homeData else { return }
            viewController.updateView(data: homeData, settings: AppCacheService.instance.settings)
            AppCacheService.instance.saveHomeData(data: homeData)
        }
        
        viewModel.onFirstAppearance = { [weak viewModel] in
            viewModel?.updateData?()
            
            LocationSerivce.instance.requestLocationData(thenRun: { coordinates in
                if let weatherData = OpenWeatherAPIService.instance.getWeatherData(from: coordinates, errorNotifier: viewController.showErrorAlert) {
                    viewModel?.homeData = HomeData(data: weatherData)
                    viewModel?.updateData?()
                }
            })
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func goToSearchScreen(onExit: ((String) -> Void)?) {
        let searchCoordinator = SearchCoordinator()
        childCoordinator = searchCoordinator
        
        searchCoordinator.onExit = onExit
        
        let searchViewController = searchCoordinator.start()
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    private func goToSettingsScreen(onExit: EmptyCallback?) {
        let settingsCoordinator = SettingsCoordinator()
        childCoordinator = settingsCoordinator
        
        settingsCoordinator.onExit = onExit
        
        let settingsViewController = settingsCoordinator.start()
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
}
