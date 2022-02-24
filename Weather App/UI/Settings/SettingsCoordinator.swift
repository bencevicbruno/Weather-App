//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

final class SettingsCoordinator: Coordinator {
    
    var onDismissed: EmptyCallback?
    
    func start() -> UIViewController {
        let viewModel = SettingsViewModel(persistenceService: ServiceFactory.persistenceService)
        let viewController = SettingsViewController(viewModel: viewModel)
        
        viewModel.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        return viewController
    }
}
