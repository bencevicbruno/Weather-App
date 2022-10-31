import SwiftUI

struct WeatherDataSubview: View {
    let data: WeatherData
    
    @EnvironmentObject var settingsData: SettingsData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                CurrentLocationDataSubview(data: data)
            }
            
            Spacer()
            
            MinMaxDataSubView(data: data)
            
            Spacer()
            Spacer()
            
            HStack(alignment: .top, spacing: 20) {
                if settingsData.showHumidity {
                    MiscDataSubView(name: "Humidity", value: data.humidity, unit: "%")
                }
                
                if settingsData.showPressure {
                    MiscDataSubView(name: "Pressure", value: data.pressure, unit: "hpa")
                }
                
                if settingsData.showWindSpeed {
                    MiscDataSubView(name: "Wind", value: data.windSpeed, unit: "mph")
                }
            }
        }
    }
}

struct WeatherDataSubview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataSubview(data: WeatherData.test)
            .background(Color.blue)
            .ignoresSafeArea()
            .environmentObject(SettingsData.sample)
    }
}
