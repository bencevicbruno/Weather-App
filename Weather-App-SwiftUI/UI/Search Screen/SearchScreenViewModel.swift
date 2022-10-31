import Foundation

class SearchScreenViewModel: ObservableObject {
    let cacheService = CacheService.instance
    let geonamesService = ServiceFactory.geonamesAPIService
    
    @Published var state: SearchViewState
    var onReturn: ((String) -> Void)?
    
    init(onReturn: ((String) -> Void)? = nil) {
        self.state = .showingPreviouslySearchedCities(cacheService.previouslySearchedCities)
        self.onReturn = onReturn
    }
    
    func searchName(_ searchKey: String) {
        self.state = .showingLoadingIndicator
        
        geonamesService.fetchListOfCities(prefixedWith: searchKey) { [weak self] fetchedCities in
            self?.state = .showingSearchResults(fetchedCities)
        } onFailure: { failure in
            self.state = .showingError(failure)
        }
    }
    
    func cityNameTapped(_ cityName: String) {
        if !cacheService.previouslySearchedCities.contains(cityName) {
            cacheService.previouslySearchedCities.insert(cityName, at: 0)
            cacheService.saveSearchScreenData()
        }
        
        self.onReturn?(cityName)
    }
}
