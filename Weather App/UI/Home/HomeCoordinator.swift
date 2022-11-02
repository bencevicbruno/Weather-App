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
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewModel.onGoToInfo = { [weak self] in
            self?.goToInfo()
        }
        
        viewModel.onGoToSearch = { [weak self] in
            self?.goToSearch()
        }
        
        viewModel.onGoToSettings = { [weak self] actionWhenDismissed in
            self?.goToSettings(actionWhenDismissed: actionWhenDismissed)
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
    
    func goToSettings(actionWhenDismissed: @escaping () -> Void) {
        guard !(childCoordinator is SettingsCoordinator) else { return }
        let coordinator = SettingsCoordinator()
        childCoordinator = coordinator
        
        coordinator.onDismissed = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            actionWhenDismissed()
        }
        
        let vc = coordinator.start()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSearch() {
        guard !(childCoordinator is SearchCoordinator) else { return }
        let searchCoordinator = SearchCoordinator()
        childCoordinator = searchCoordinator
        
        searchCoordinator.onDismissed = { [weak self] in
            guard let self = self else { return }
            
            self.navigationController?.popViewController(animated: true)
            self.childCoordinator = nil
        }
        
        let searchViewController = searchCoordinator.start()
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}
