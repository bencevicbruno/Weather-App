//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    var onStateChanged: ((State) -> Void)?
    
    var onGoToSearch: EmptyCallback?
    var onGoToSettings: EmptyCallback?
    var onGoToInfo: EmptyCallback?
    
    var cachedHomeData: HomeData!
    
    private let persistenceService: PersistenceServiceProtocol
    private let openWeatherAPIService: OpenWeatherAPIServiceProtocol
    private let locationService: LocationServiceProtocol
    
    private var state: State = .loading {
        didSet {
            onStateChanged?(state)
        }
    }
    
    init(persistenceService: PersistenceServiceProtocol, openWeatherAPIService: OpenWeatherAPIServiceProtocol, locationService: LocationServiceProtocol) {
        self.persistenceService = PersistenceService()
        self.openWeatherAPIService = OpenWeatherAPIService()
        self.locationService = LocationSerivce.instance
    }
    
    func updateData() {
        self.state = .showingData(cachedHomeData, persistenceService.settingsData)
    }
    
    func fetchWeatherData(for location: String? = nil) {
        state = .loading
        
        if let location = location {
            fetchWeatherDataForLocation(location)
        } else {
            if let homeData = persistenceService.homeData {
                state = .showingData(homeData, persistenceService.settingsData)
            } else {
                fetchWeatherDataForCurrentLocation()
            }
        }
    }
}

extension HomeViewModel {
    
    enum State {
        case showingData(HomeData, SettingsData)
        case loading
        case error(Error)
    }
}

private extension HomeViewModel {
    
    func fetchWeatherDataForLocation(_ location: String) {
        state = .loading
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.openWeatherAPIService.fetchWeatherData(for: location) { result in
                self?.didFetchWeatherData(result)
            }
        }
    }
    
    func fetchWeatherDataForCurrentLocation() {
        state = .loading
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.locationService.fetchLocation { locationCoordinates in
                self?.openWeatherAPIService.fetchWeatherData(from: locationCoordinates) { result in
                    self?.didFetchWeatherData(result)
                }
            }
        }
    }
    
    func didFetchWeatherData(_ result: Result<OpenWeatherAPIResponse, Error>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch(result) {
            case .success(let response):
                let homeData = HomeData(data: response)
                self.state = .showingData(homeData, self.persistenceService.settingsData)
                self.persistenceService.homeData = homeData
                self.cachedHomeData = homeData
            case .failure(let error):
                self.state = .error(error)
            }
        }
    }
}
