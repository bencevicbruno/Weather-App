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
        let vc = createSearchVC()
        
        return vc
    }
    
    private func createSearchVC() -> UIViewController {
        let vc = SearchViewController()
        vc.viewModel = SearchViewModel()
        
        //TODO: setup viewModel
        
        return vc
    }
}
