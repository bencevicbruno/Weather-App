enum HomeViewState {
    case showingError(Failure)
    case showingData(WeatherData)
    case showingLoadingIndicator
}
