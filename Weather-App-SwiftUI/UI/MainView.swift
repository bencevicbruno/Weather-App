import SwiftUI


struct MainView: View {
    @State private var showingSettingsSheet = false
    
    var body: some View {
        NavigationView {
            HomeView(viewModel: HomeScreenViewModel())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
