//
//  SearchViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Combine
import SwiftUI

final class SearchViewModel: ObservableObject {
    
    var onDismissed: EmptyCallback!
    
    @Published var searchText = ""
    @Published var isEditing = false
    @Published var isSearchFieldInFocus: Bool = false
    
    @Published private(set) var results: [String] = []
    @Published private(set) var previousResults: [String] = []
    @Published private(set) var isActivityRunning = false
    @Published private(set) var error: SearchError?
    
    @Service(.singleton) var persistenceService: PersistenceServiceProtocol
    @Service var locationNamesService: LocationNamesServiceProtocol
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        previousResults = persistenceService.searchedLocationsData.locations
        setupCancellables()
    }
    
    // MARK: - User Interactions
    
    func didTapBackButton() {
        onDismissed?()
    }
    
    func didTapDeleteButton() {
        previousResults = []
        persistenceService.searchedLocationsData = .init(locations: [])
    }
    
    func didTapLocationCell(location: String) {
        persistenceService.targetLocation = location
        persistenceService.searchedLocationsData.append(location)
        NotificationCenter.default.post(name: .loadWeatherDataNotification, object: nil)
        onDismissed()
    }
}

private extension SearchViewModel {
    
    func setupCancellables() {
        self.$searchText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .sink { [weak self] (value: String) in
                guard value != "" else { return }
                
                self?.fetchLocation(containing: value)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - API Calls
    
    func fetchLocation(containing key: String) {
        isActivityRunning = true
        
        Task {
            do {
                let locations = try await locationNamesService.fetchCities(prefixedWith: key)
                
                if locations.isEmpty {
                    if self.error != .empty {
                        await MainActor.run {
                            withAnimation(.linear(duration: 0.3)) {
                                self.error = .empty
                            }
                        }
                    }
                } else {
                    await MainActor.run {
                        withAnimation(.linear(duration: 0.3)) {
                            self.error = nil
                            
                            self.results = locations.filter { location in
                                !previousResults.contains(where: { $0 == location })
                            }
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    withAnimation(.linear(duration: 0.3)) {
                        self.error = .init(systemImageName: "antenna.radiowaves.left.and.right.slash",
                                           title: "Ooops",
                                           description: "Couldn't find any locations you were looking for :(",
                                           detailedDescription: error.localizedDescription)
                    }
                }
            }
            
            await MainActor.run {
                withAnimation(.linear(duration: 0.3)) {
                    self.isActivityRunning = false
                }
            }
        }
    }
}
