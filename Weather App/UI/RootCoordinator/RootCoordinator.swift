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
        let viewController: UIViewController
        
        viewController = createHomeViewController()
        
        return viewController
    }
    
    private func createHomeViewController() -> UIViewController {
        let weatherCoordinator = HomeCoordinator()
        
        childCoordinator = weatherCoordinator
        let homeViewController = weatherCoordinator.start()
        
        return homeViewController
    }
}
