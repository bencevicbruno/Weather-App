enum SearchViewState {
    case showingError(Failure)
    case showingLoadingIndicator
    case showingPreviouslySearchedCities([String])
    case showingSearchResults([String])
}
