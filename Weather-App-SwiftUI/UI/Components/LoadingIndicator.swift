import SwiftUI

struct LoadingIndicator: View {
    let color: Color
    @State private var shouldAnimate = false
    
    var body: some View {
        HStack(alignment: .center) {
            circle
                .animation(animation)
            
            circle
                .animation(animation.delay(0.3))
            
            circle
                .animation(animation.delay(0.6))
        }
        .onAppear {
            DispatchQueue.main.async {
                withAnimation {
                    self.shouldAnimate = true
                }
            }
        }
    }
    
    var circle: some View {
        Circle()
            .fill(color)
            .frame(width: 20, height: 20)
            .scaleEffect(self.shouldAnimate ? 1.0 : 0.5)
    }
    
    var animation: Animation {
        Animation.easeInOut(duration: 1.0).repeatForever()
    }
    
    init(color: Color = .white) {
        self.color = color
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
            .background(Color.blue)
    }
}
