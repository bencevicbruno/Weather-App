import SwiftUI

struct CityListView: View {
    let cities: [String]
    let onCityTapped: ((String) -> Void)?
    
    var body: some View {
        List {
            ForEach(cities, id: \.self) { city in
                Text(city)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.onCityTapped?(city)
                    }
            }
            .listRowBackground(Color.clear)
        }
    }
    
    init(cities: [String], onCityTapped: ((String) -> Void)? = nil) {
        self.cities = cities
        self.onCityTapped = onCityTapped
        
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .none
        UITableView.appearance().backgroundColor = .none
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        let cities = (1...10).map { "City #\($0)" }
        
        CityListView(cities: cities)
    }
}
