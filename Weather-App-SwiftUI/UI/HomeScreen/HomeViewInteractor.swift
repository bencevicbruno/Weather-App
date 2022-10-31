import Foundation
import SwiftUI

class HomeScreenViewModel: ObservableObject {
    let locationService = ServiceFactory.locationService
    let weatherService = ServiceFactory.openWeatherApiService
    
    @Published var state: HomeViewState
    
    init() {
        guard let homeScreenData = CacheService.instance.weatherData else {
            self.state = .showingLoadingIndicator
            self.fetchWeatherDataFromCurrentLocation()
            return
        }
        
        self.state = .showingData(homeScreenData)
    }
    
    func fetchWeatherDataFromCurrentLocation() {
        self.state = .showingLoadingIndicator
        
        let request = LocationRequest({ [weak self] location in
            self?.weatherService.fetchWeatherData(from: location) { [weak self] response in
                self?.showWeatherData(response)
            } onFailure: { [weak self] failure in
                self?.state = .showingError(failure)
            }
        }, failureHandler: { [weak self] failure in
            self?.showError(failure)
        })
        
        locationService.requestLocation(request)
    }
    
    func fetchWeatherData(for cityName: String) {
        self.state = .showingLoadingIndicator
        
        weatherService.fetchWeatherData(for: cityName) { [weak self] response in
            self?.showWeatherData(response)
        } onFailure: { [weak self] failure in
            self?.showError(failure)
        }
    }
    
    func showWeatherData(_ response: OpenWeatherAPIResponse) {
        let data = WeatherData(response: response)
        
        self.state = .showingData(data)
        CacheService.instance.weatherData = data
    }
    
    func showError(_ failure: Failure) {
        self.state = .showingError(failure)
    }
    
    
    func searchScreenButton<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        let viewModel = SearchScreenViewModel { [weak self] cityName in
            self?.fetchWeatherData(for: cityName)
        }
        
        return NavigationLink(destination: SearchScreenView(viewModel: viewModel)) {
            content()
        }
    }
    
    func settingsScreenButton<Content: View>(data: SettingsData, onExit: @escaping (SettingsData) -> Void, @ViewBuilder content: () -> Content) -> some View {
        let state = SettingsViewState(from: data)
        let interactor = SettingsViewInteractor(state: state, onExit: onExit)
        
        return NavigationLink(destination: SettingsView(interactor: interactor)) {
            content()
        }
    }
}
