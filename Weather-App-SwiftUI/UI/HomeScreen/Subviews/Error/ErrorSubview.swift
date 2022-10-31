import SwiftUI

struct ErrorSubview: View {
    let title: String
    let message: String
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text(message)
                .multilineTextAlignment(.center)
        }
        .frame(width: 250)
        .padding()
        .background(Color.red.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    init(_ title: String, message: String? = nil) {
        self.title = title
        self.message = message ?? "No further information provided."
    }
}

struct ErrorSubview_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSubview("Test Error")
        ErrorSubview("Test Error", message: "This is a very long error to test how the wrapping behaves.")
    }
}
