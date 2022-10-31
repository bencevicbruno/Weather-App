import SwiftUI

struct SearchScreenView: View {
    @ObservedObject var viewModel: SearchScreenViewModel
    
    @State private var searchKey: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Background()
                
                VStack {
                    HStack {
                        BackButton()
                        Spacer()
                    }
                    
                    SearchbarSubview($searchKey, onSearchButtonTapped: self.viewModel.searchName)
                        .padding()
                    
                    self.searchViewBody
                        .padding()
                    
                    Spacer()
                }
                .padding()
            }
            .removeNavigationBar()
        }
    }
    
    var searchViewBody: AnyView {
        switch (viewModel.state) {
        case .showingError(let failure):
            return AnyView(ErrorSubview(failure.error, message: failure.message))
        case .showingLoadingIndicator:
            return AnyView(LoadingIndicator(color: .white.opacity(0.8)))
        case .showingPreviouslySearchedCities(let cities):
            return AnyView(
                CityListView(cities: cities, onCityTapped: self.cityNameTapped)
            )
        case .showingSearchResults(let cities):
            return AnyView(
                CityListView(cities: cities, onCityTapped: self.cityNameTapped)
            )
        }
    }
    
    func cityNameTapped(_ cityName: String) {
        self.viewModel.cityNameTapped(cityName)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    init(viewModel: SearchScreenViewModel) {
        self.viewModel = viewModel
        
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .none
        UITableView.appearance().backgroundColor = .none
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchScreenViewModel()
        
        SearchScreenView(viewModel: viewModel)
    }
}
