import SwiftUI

struct Background: View {
    var body: some View {
        GeometryReader { geo in
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
