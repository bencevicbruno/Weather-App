//
//  SearchCoordinator.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    
    var onExit: ((String) -> Void)?
    
    func start() -> UIViewController {
        let viewController = createSearchVC()
        
        return viewController
    }
    
    private func createSearchVC() -> UIViewController {
        let viewController = SearchViewController()
        let viewModel = SearchViewModel()
        
        viewModel.onSearchButtonTapped = { [weak viewController, weak viewModel] searchFieldText in
            guard let viewModel = viewModel else { return }
            
            if searchFieldText.isEmpty {
                viewModel.onEmptySearchField?()
                return
            }
            
            DispatchQueue.global(qos: .background).async {
                let fetchedCities = viewModel.geonamesService.getListOfCities(prefixedWith: searchFieldText, errorNotifier: { [weak viewController] title, message in
                    DispatchQueue.main.async {
                        viewController?.showErrorAlert(title: title, message: message)
                    }
                })
                
                viewModel.showingCachedLocations = false
                viewModel.fetchedLocations = fetchedCities
                
                DispatchQueue.main.async {
                    viewController?.setTableData(viewModel.fetchedLocations)
                }
            }
        }
        
        viewModel.onEmptySearchField = { [weak viewController] in
            viewController?.showErrorAlert(title: "Plase insert a city name in the search field!")
        }
        
        viewModel.onCityCellTapped = { [weak viewController, weak viewModel] cellIndex in
            guard let viewModel = viewModel else { return }
            
            let cityName = (viewModel.showingCachedLocations ? viewModel.cachedLocations : viewModel.fetchedLocations)[cellIndex]
            viewModel.cachedLocations.append(cityName)
            self.onExit?(cityName)
            viewController?.navigationController?.popViewController(animated: true)
        }
        
        viewModel.onExit = { [weak viewModel] in
            guard let viewModel = viewModel else { return }
            viewModel.cacheService.saveCachedLocations(viewModel.cachedLocations)
        }
        
        viewController.viewModel = viewModel
        return viewController
    }
}
