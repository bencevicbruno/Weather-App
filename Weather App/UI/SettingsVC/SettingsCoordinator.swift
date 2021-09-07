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
        
        //TODO: setup viewModel
        
        viewController.viewModel = viewModel
        return viewController
    }
}
