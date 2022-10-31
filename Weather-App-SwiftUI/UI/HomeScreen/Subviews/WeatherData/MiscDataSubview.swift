import SwiftUI

struct MiscDataSubView: View {
    var name: String
    var value: Float
    var unit: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(name)
                .fontWeight(.regular)
                .font(Font.system(size: 20))
                .layoutPriority(1)
            
            Text("\(formattedValue) \(unit)")
                .fontWeight(.medium)
                .font(Font.system(size: 24))
                .layoutPriority(1)
        }.foregroundColor(Color.white)
    }
    
    var formattedValue: String {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

struct MiscDataSubView_Previews: PreviewProvider {
    static var previews: some View {
        MiscDataSubView(name: "Humidity", value: 0.79, unit: "%")
            .background(Color.blue)
    }
}
