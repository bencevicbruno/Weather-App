//
//  SearchViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchViewModel {
    var geonamesService = GeonamesService()
    var cacheService = AppCacheService()
    var cachedLocations: [String]
    var fetchedLocations = [String]()
    var showingCachedLocations = true
    
    var onSearchButtonTapped: ((String) -> Void)?
    var onEmptySearchField: EmptyCallback?
    var onCityCellTapped: ((Int) -> Void)?
    var onExit: EmptyCallback?
    
    init() {
        cachedLocations = cacheService.cachedLocations
    }
    
    deinit {
        
    }
}
