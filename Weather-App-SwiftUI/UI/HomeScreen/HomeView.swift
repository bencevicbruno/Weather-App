import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeScreenViewModel
    
    @EnvironmentObject var settingsData: SettingsData
    
    var body: some View {
        ZStack {
            Background()
            
            self.navigationButtons
            
            self.content
        }
        .removeNavigationBar()
    }
    
    var navigationButtons: some View {
        VStack {
            HStack(alignment: .top, spacing: 20) {
                self.viewModel.searchScreenButton {
                    Image("search")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                self.viewModel.settingsScreenButton(data: settingsData, onExit: self.updateSettingsData) {
                    Image("settings")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
    
    var content: some View {
        switch (viewModel.state) {
        case .showingError(let failure):
            return AnyView(
                ErrorSubview(failure.error, message: failure.message)
                    .foregroundColor(Color.white))
            
        case .showingData(let data):
            return AnyView(
                WeatherDataSubview(data: data)
                    .padding())
            
        case .showingLoadingIndicator:
            return AnyView(
                LoadingIndicator(color: .white.opacity(0.8))
            )
        }
    }
    
    func updateSettingsData(_ newSettingsData: SettingsData) {
        self.settingsData.update(newSettingsData)
        CacheService.instance.settings = newSettingsData
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeScreenViewModel())
    }
}
