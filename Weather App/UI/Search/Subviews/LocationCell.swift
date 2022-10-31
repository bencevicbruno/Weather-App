//
//  LocationCell.swift
//  Weather App
//
//  Created by Bruno Bencevic on 27.10.2022..
//

import SwiftUI

struct LocationCell: View {
    
    private let location: String
    private let isPlaceholder: Bool
    
    init(location: String, isPlaceholder: Bool = false) {
        self.location = location
        self.isPlaceholder = isPlaceholder
    }
    
    var body: some View {
        HStack(spacing: 16) {
            if isPlaceholder {
                Spacer()
            }
            
            Text(location)
                .lineLimit(isPlaceholder ? 3 : 1)
                .multilineTextAlignment(isPlaceholder ? .center : .leading)
            
            Spacer()
            
            if !isPlaceholder {
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
        .fontWeight(.medium)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
        .background(BlurredView(style: .light))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .addShadow(.gray.opacity(0.3))
    }
}

struct LocationCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            LocationCell(location: "Example Location")
                .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
        )
    }
}
