//
//  WrapHStack.swift
//  Weather App
//
//  Created by Bruno Bencevic on 02.11.2022..
//

import SwiftUI

struct WrapHStack<Content>: View where Content: View {
    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    
    @ViewBuilder let content: () -> Content
    
    @State private var platforms = ["Ninetendo", "XBox", "PlayStation", "PlayStation 2", "PlayStation 3", "PlayStation 4"]
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
            .background(.yellow)
            
            Color.red
                .layoutPriority(1)
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.platforms, id: \.self) { platform in
                self.item(for: platform)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= (d.height + verticalSpacing)
                        }
                        
                        let result = width
                        
                        if platform == self.platforms.last! {
                            width = 0
                        } else {
                            width -= (d.width + horizontalSpacing)
                        }
                        
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        
                        if platform == self.platforms.last! {
                            height = 0
                        }
                        
                        return result
                    })
            }
            
        }
    }
    
    func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
}

struct WrapHStack_Previews: PreviewProvider {
    static var previews: some View {
        WrapHStack {
            Text("")
        }
        .padding()
    }
}
