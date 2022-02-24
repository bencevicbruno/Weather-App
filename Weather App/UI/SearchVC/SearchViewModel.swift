//
//  SearchViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchViewModel {
    var geonamesService = GeonamesAPIService()
//    var cacheService = AppCacheService()
    var cachedLocations: [String]
    var fetchedLocations = [String]()
    var showingCachedLocations = true
    
    var onSearchButtonTapped: ((String) -> Void)?
    var onEmptySearchField: EmptyCallback?
    var onCityCellTapped: ((Int) -> Void)?
    var onDismissed: ((String?) -> Void)?
    
    init() {
        cachedLocations = PersistenceService.init().searchedLocationsData.locations
    }
    func dismiss() {
        onDismissed?(nil)
    }
}
