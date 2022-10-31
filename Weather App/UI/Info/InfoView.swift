//
//  InfoView.swift
//  Weather App
//
//  Created by Bruno Bencevic on 12.10.2022..
//

import SwiftUI
import ConfettiSwiftUI

struct InfoView: View {
    
    @ObservedObject var viewModel: InfoViewModel
    
    @State private var confettiCounter = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            textContent
                .padding()
            
            Spacer()
            
            surpriseButton
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .confettiCannon(counter: $confettiCounter, num: 100, confettis: [.shape(.roundedCross)], colors: [.white, .black, .cyan, .blue, .gray, .pink, .purple, .red], confettiSize: 20, rainHeight: UIScreen.main.bounds.height * 0.75, radius: UIScreen.main.bounds.width)
    }
}

private extension InfoView {
    
    var textContent: some View {
        Text("This app was created as a project in UIKit during the iOS Summer School @COBE. This screen was later added as as UIKit sscreen, but then implemented as a SwiftUI view wrapped inside UIHostingViewController.")
            .foregroundColor(.white)
            .fontWeight(.medium)
            .font(.system(size: 20))
            .padding(15)
            .background(.black.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var surpriseButton: some View {
        Text("Tap for surprise".uppercased())
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.opacity(0.25))
            )
            .padding(.horizontal, 40)
            .contentShape(RoundedRectangle(cornerRadius: 15))
            .onTapGesture {
                confettiCounter += 100
                viewModel.dismissAfter(seconds: 5)
            }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoView(viewModel: .init())
        }
        .navigationViewStyle(.stack)
    }
}
