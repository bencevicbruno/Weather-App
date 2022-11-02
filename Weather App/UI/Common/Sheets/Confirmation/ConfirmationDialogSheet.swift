//
//  ConfirmationDialogSheet.swift
//  Weather App
//
//  Created by Bruno Bencevic on 31.10.2022..
//

import SwiftUI

struct ConfirmationDialogSheet: View {
    
    @Binding var isVisible: Bool
    private let dialog: ConfirmationDialog
    
    init(dialog: ConfirmationDialog, isVisible: Binding<Bool>) {
        self.dialog = dialog
        self._isVisible = isVisible
    }
    
    @State private var didAppear = false
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BlurredView(style: .light)
                .opacity(didAppear ? 1 : 0)
                .onTapGesture {
                    onDeclineTapped()
                }
            
            VStack(spacing: 0) {
                Text(dialog.message)
                    .font(.title3)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                        BlurredView(style: .light)
                            .opacity(0.5)
                    )
                
                HStack(spacing: 2) {
                    Text(dialog.declineTitle)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            BlurredView(style: .light)
                                .opacity(0.5)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onDeclineTapped()
                        }
                    
                    Text(dialog.confirmTitle)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            BlurredView(style: .light)
                                .opacity(0.5)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onConfirmTapped()
                        }
                }
                .background(
                    BlurredView(style: .light)
                        .opacity(0.5)
                )
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 12)
            .padding(.bottom, max(UIScreen.main.bottomUnsafePadding, 12))
            .readSize(into: $contentSize)
            .offset(y: didAppear ? 0 : contentSize.height)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                didAppear = true
            }
        }
    }
}

private extension ConfirmationDialogSheet {
    
    func onDeclineTapped() {
        withAnimation(.easeOut(duration: 0.3)) {
            didAppear = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isVisible = false
            dialog.declineAction()
        }
    }
    
    func onConfirmTapped() {
        withAnimation(.easeOut(duration: 0.3)) {
            didAppear = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isVisible = false
            dialog.confirmAction()
        }
    }
}

struct ConfirmationDialogSheet_Previews: PreviewProvider {
    
    static var previews: some View {
        ConfirmationDialogSheet(dialog: .init(message: "This should be a message indicating the user that they should either confirm or deny the following action."), isVisible: .constant(true))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("image_background")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
    }
}
