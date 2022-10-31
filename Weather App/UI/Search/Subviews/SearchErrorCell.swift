//
//  SearchErrorCell.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import SwiftUI

struct SearchErrorCell: View {
    
    private let error: SearchError
    private let onTapped: EmptyCallback
    
    @State private var isShowingDetailedDescription = false
    
    init(error: SearchError, onTapped: @escaping EmptyCallback) {
        self.error = error
        self.onTapped = onTapped
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                Image(systemName: error.systemImageName)
                    .frameAsIcon(innerSize: 40, outerSize: 64)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(error.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(error.description)
                        .lineLimit(2)
                        .font(.body)
                        .fontWeight(.light)
                }
            }
            .frame(height: 80)
            
            if error.detailedDescription != nil {
                Rectangle()
                    .fill(.black)
                    .frame(height: 1)
                
                Text(isShowingDetailedDescription ? error.detailedDescription! : "Tap to show more info...")
                    .multilineTextAlignment(isShowingDetailedDescription ? .leading : .center)
                    .font(isShowingDetailedDescription ? .body : .callout)
                    .fontWeight(isShowingDetailedDescription ? .regular : .medium)
                    .padding(.bottom, 8)
            }
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(BlurredView(style: .light))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .onTapGesture {
            withAnimation(.linear(duration: 0.3)) {
                isShowingDetailedDescription.toggle()
                onTapped()
            }
        }
    }
}

struct SearchErrorCell_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchErrorCell(error: .previewSample, onTapped: {})
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("image_background")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
    }
}
