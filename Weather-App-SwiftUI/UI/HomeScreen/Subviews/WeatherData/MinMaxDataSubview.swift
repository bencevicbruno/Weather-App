import SwiftUI

struct MinMaxDataSubView: View {
    let data: WeatherData
    
    @EnvironmentObject var settingsData: SettingsData
    
    var body: some View {
        HStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("min")
                Text(minimalTemperature)
            }
            
            VStack(spacing: 5) {
                Text("max")
                Text(maximalTemperature)
            }
        }
        .font(Font.system(size: 30))
    }
    
    var minimalTemperature: String {
        settingsData.useCelsius ?
            "\(String(format: "%.1f", data.minimalTemperature)) C" :
            "\(String(format: "%.1f", data.minimalTemperature.toFahrenheit())) F"
    }
    
    var maximalTemperature: String {
        settingsData.useCelsius ?
            "\(String(format: "%.1f", data.maximalTemperature)) C" :
            "\(String(format: "%.1f", data.maximalTemperature.toFahrenheit())) F"
    }
}

struct MinMaxDataSubView_Previews: PreviewProvider {
    static var previews: some View {
        MinMaxDataSubView(data: WeatherData.test)
            .environmentObject(SettingsData.sample)
    }
}
