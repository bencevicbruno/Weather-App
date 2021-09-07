//
//  SearchCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    
    var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let viewController = createSearchVC()
        
        return viewController
    }
    
    private func createSearchVC() -> UIViewController {
        let viewController = SearchViewController()
        let viewModel = SearchViewModel()
        
        //TODO: setup viewModel
        
        viewController.viewModel = viewModel
        return viewController
    }
}
