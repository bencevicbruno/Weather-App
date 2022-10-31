import Combine

class SettingsViewInteractor: ObservableObject {
    let cacheService = CacheService.instance
    
    @Published var state: SettingsViewState
    private var onExit: ((SettingsData) -> Void)?
    
    init(state: SettingsViewState, onExit: ((SettingsData) -> Void)? = nil) {
        self.state = state
        self.onExit = onExit
    }
    
    func backButtonPressed() {
        self.onExit?(SettingsData(from: self.state))
    }
}
