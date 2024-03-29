//
//  RootCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

final class RootCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    
    func start() -> UIViewController {
        let weatherCoordinator = HomeCoordinator()
        
        childCoordinator = weatherCoordinator
        let homeViewController = weatherCoordinator.start()
        
        return homeViewController
    }
    
    func deepLinkToSettings() {
        guard let homeCoordinator = childCoordinator as? HomeCoordinator else { return }
        homeCoordinator.goToSettings(actionWhenDismissed: {})
    }
    
    func deepLinkToSearch() {
        guard let homeCoordinator = childCoordinator as? HomeCoordinator else { return }
        homeCoordinator.goToSearch()
    }

}
