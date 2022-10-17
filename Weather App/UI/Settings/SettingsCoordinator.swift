//
//  SettingsCoordinator.swift
//  Weather App
//
//  Created by Bruno Bencevic on 13.10.2022..
//

import UIKit

final class SettingsCoordinator: Coordinator {
    
    var onDismissed: (() -> Void)?
    
    func start() -> UIViewController {
        let vm = SettingsViewModel(persistenceService: ServiceFactory.persistenceService)
        let vc = SettingsViewController(viewModel: vm)
        
        vm.onDismissed = { [weak self] in
            self?.onDismissed?()
        }
        
        return vc
    }
}
