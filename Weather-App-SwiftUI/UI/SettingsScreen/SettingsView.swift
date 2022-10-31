import Combine
import SwiftUI

struct SettingsView: View {
    @ObservedObject var interactor: SettingsViewInteractor
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                HStack {
                    BackButton(action: self.interactor.backButtonPressed)
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        TextWithCheckboxSubview($interactor.state.useCelsius, text: "Celsius")
                        
                        Spacer()
                    }
                    
                    HStack {
                        TextWithCheckboxSubview($interactor.state.useCelsius.opposite, text: "Fahrenheit")
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    ImageWithCheckboxSubview($interactor.state.showHumidity, imageName: "humidity")
                    
                    ImageWithCheckboxSubview($interactor.state.showPressure, imageName: "pressure")
                    
                    ImageWithCheckboxSubview($interactor.state.showWindSpeed, imageName: "wind")
                }
                
                Spacer()
            }
            .padding()
        }
        .removeNavigationBar()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let state = SettingsViewState.test
        SettingsView(interactor: SettingsViewInteractor(state: state))
    }
}
