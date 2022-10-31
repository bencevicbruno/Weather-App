import SwiftUI

struct CurrentLocationDataSubview: View {
    let data: WeatherData
    
    @EnvironmentObject var settingsData: SettingsData
    
    var body: some View {
        VStack(alignment: .trailing) {
            Image(systemName: data.weatherIcon)
                .resizable()
                .frame(width: 90, height: 90)
                .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.3))
            
            HStack {
                Text(currentTemperature)
                    .font(Font.system(size: 70))
                    .fontWeight(.heavy)
                
                Text(temperatureUnit)
                    .font(Font.system(size: 80))
            }
            
            Text(data.location)
                .font(Font.system(size: 30))
                .fontWeight(.regular)
        }
    }
    
    var currentTemperature: String {
        return String(settingsData.useCelsius ? data.currentTemperature : data.currentTemperature.toFahrenheit())
    }
    
    var temperatureUnit: String {
        settingsData.useCelsius ? "°C" : "°F"
    }
}

struct CurrentLocationDataSubview_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationDataSubview(data: WeatherData.test)
            .environmentObject(SettingsData.sample)
    }
}
