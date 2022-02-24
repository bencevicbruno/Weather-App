//
//  SearchViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

final class SearchViewModel {
    
    var onDismissed: ((String?) -> Void)?
    var onStateChanged: ((State) -> Void)?
    
    private var state: State = .loading {
        didSet {
            onStateChanged?(state)
        }
    }
    
    private let persistenceService: PersistenceServiceProtocol
    private let geonameService: GeonamesAPIServiceProtocol
    
    init(persistenceService: PersistenceServiceProtocol, geonamesService: GeonamesAPIServiceProtocol) {
        self.persistenceService = persistenceService
        self.geonameService = geonamesService
    }
    
    func fetchSearchedLocations() {
        state = .showingLocations(persistenceService.searchedLocationsData.locations)
    }
    
    func fetchLocation(containing key: String) {
        state = .loading
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            self.geonameService.fetchCities(prefixedWith: key) { result in
                DispatchQueue.main.async {
                    switch(result) {
                    case .success(let response):
                        let locations = response.locations.filter { response.locations.firstIndex(of: $0) ?? 10 < 10 }
                        self.state = .showingLocations(locations)
                    case .failure(let error):
                        self.state = .showingError(error)
                    }
                }
            }
        }
    }
    
    func dismiss(location: String? = nil) {
        if let location = location {
            var searchedLocations = persistenceService.searchedLocationsData.locations
            searchedLocations.insert(location, at: 0)
            searchedLocations = searchedLocations.filter { searchedLocations.firstIndex(of: $0) ?? 10 < 10 }
            persistenceService.searchedLocationsData = SearchedLocationsData(locations: searchedLocations)
        }
        
        onDismissed?(location)
    }
}

extension SearchViewModel {
    
    enum State {
        case showingLocations([String])
        case loading
        case showingError(Error)
    }
}
