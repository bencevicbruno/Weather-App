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
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc: UIViewController
        
        vc = createHomeVC()
        
        return vc
    }
    
    private func createHomeVC() -> UIViewController {
        let homeCoordinator = WeatherCoordinator()
        
        childCoordinator = homeCoordinator
        let rootVC = homeCoordinator.start()
        rootVC.showAsRoot()
        
        return rootVC
    }
    
}
