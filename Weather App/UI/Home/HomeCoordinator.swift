//
//  HomeCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        let viewController = createHomeViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        
        return navigationController
    }
    
    private func createHomeViewController() -> UIViewController {
        let viewModel = HomeViewModel(persistenceService: ServiceFactory.persistenceService, openWeatherAPIService: ServiceFactory.openWeatherAPIService, locationService: ServiceFactory.locationService)
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewModel.onGoToInfo = { [weak self] in
            self?.goToInfo()
        }
        
        viewModel.onGoToSearch = { [weak self, weak viewModel] in
            self?.goToSearch(onDismissed: { selectedLocation in
                guard let selectedLocation = selectedLocation else { return }
                viewModel?.fetchWeatherData(for: selectedLocation)
            })
        }
        
        viewModel.onGoToSettings = { [weak self, weak viewModel] in
            self?.goToSettings(onDismissed: {
                viewModel?.updateData()
            })
        }
        
        return viewController
    }
    
    private func goToInfo() {
        let infoCoordinator = InfoCoordinator()
        childCoordinator = infoCoordinator
        
        infoCoordinator.onDismissed = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            self?.childCoordinator = nil
        }
        
        let infoViewController = infoCoordinator.start()
        self.navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    private func goToSearch(onDismissed: ((String?) -> Void)? = nil) {
        let searchCoordinator = SearchCoordinator()
        childCoordinator = searchCoordinator
        
        searchCoordinator.onDismissed = { [weak self] selectedLocation in
            onDismissed?(selectedLocation)
            self?.navigationController?.popViewController(animated: true)
            self?.childCoordinator = nil
        }
        
        let searchViewController = searchCoordinator.start()
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    private func goToSettings(onDismissed: EmptyCallback? = nil) {
        let settingsCoordinator = SettingsCoordinator()
        childCoordinator = settingsCoordinator
        
        settingsCoordinator.onDismissed = { [weak self] in
            onDismissed?()
            self?.navigationController?.popViewController(animated: true)
            self?.childCoordinator = nil
        }
        
        let settingsViewController = settingsCoordinator.start()
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
}
