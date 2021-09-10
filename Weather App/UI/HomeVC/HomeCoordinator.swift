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
        
        viewModel.onGoToSearchScreen = { [weak self] in
            self?.goToSearchScreen()
        }
        
        viewModel.onGoToSettingsScreen = { [weak self] in
            self?.goToSettingsScreen(onExit: {
                viewModel.updateData?()
            })
        }
        
        viewModel.updateData = {
            guard let homeData = viewModel.homeData else { return }
            viewController.updateView(data: homeData, settings: AppCacheService.instance.settings)
            AppCacheService.instance.saveHomeData(data: homeData)
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func goToSearchScreen() {
        let searchCoordinator = SearchCoordinator()
        childCoordinator = searchCoordinator
        
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
