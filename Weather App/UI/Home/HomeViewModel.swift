//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import Foundation
import UIKit
import WidgetKit

final class HomeViewModel {
    
    var onStateChanged: ((State) -> Void)?
    
    var onGoToSettings: ((_ actionWhenDismissed: @escaping EmptyCallback) -> Void)?
    var onGoToSearch: EmptyCallback?
    var onGoToInfo: EmptyCallback?
    
    var cachedHomeData: HomeData!
    
    @Service(.singleton) private var persistenceService: PersistenceServiceProtocol
    @Service private var weatherService: WeatherServiceProtocol
    
    private var state: State = .loading {
        didSet {
            onStateChanged?(state)
        }
    }
    
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadWeatherData), name: .loadWeatherDataNotification, object: nil)
    }
    
    @MainActor
    @objc func loadWeatherData() {
        guard let targetLocation = persistenceService.targetLocation else { return }
        
        fetchWeatherData(for: targetLocation)
        persistenceService.targetLocation = nil
    }
    
    func updateData() {
        self.state = .showingData(cachedHomeData, persistenceService.settingsData)
    }
    
    @MainActor
    func fetchWeatherData(for location: String? = nil) {
        state = .loading
        
        if let location = location {
            fetchWeatherDataForLocation(location)
        } else {
            fetchWeatherDataForCurrentLocation()
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
    
    @MainActor
    func fetchWeatherDataForLocation(_ location: String) {
        state = .loading
        
        Task {
            do {
                let weatherData = try await weatherService.fetchWeatherData(for: location)
                self.persistenceService.homeData = weatherData
                self.cachedHomeData = weatherData
                
                self.state = .showingData(weatherData, persistenceService.settingsData)
                WidgetCenter.shared.reloadAllTimelines()
            } catch {
                self.state = .error(error)
            }
        }
    }
    
    @MainActor
    func fetchWeatherDataForCurrentLocation() {
        state = .loading
        
        Task {
            do {
                let weatherData = try await weatherService.fetchWeatherDataForCurrentLocation()
                self.persistenceService.homeData = weatherData
                self.cachedHomeData = weatherData
                
                self.state = .showingData(weatherData, persistenceService.settingsData)
                WidgetCenter.shared.reloadAllTimelines()
            } catch {
                self.state = .error(error)
            }
        }
    }
}
