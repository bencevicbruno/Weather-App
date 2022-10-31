//
//  SearchView2.swift
//  Weather App
//
//  Created by Bruno Bencevic on 26.10.2022..
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel : SearchViewModel
    
    @FocusState var isSearchFieldInFocus: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            resultsList
            
            navigationBar
                .padding(.top, UIScreen.main.topUnsafePadding)
                .padding(.horizontal, 16)
                .background(BlurredView(style: .light))
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .contentShape(Rectangle())
        .background(
            Image("image_background")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.all)
        .toolbar(.hidden, for: .navigationBar)
        .onChange(of: isSearchFieldInFocus) { isInFocus in
            withAnimation(.easeOut(duration: 0.3)) {
                viewModel.isEditing = isInFocus
                viewModel.isSearchFieldInFocus = isInFocus
            }
        }
        .onChange(of: viewModel.isSearchFieldInFocus) { isInFocus in
            withAnimation(.easeOut(duration: 0.3)) {
                isSearchFieldInFocus = isInFocus
            }
        }
        .foregroundColor(.black)
        .onTapGesture {
            isSearchFieldInFocus = false
        }
        .onAppear {
            isSearchFieldInFocus = viewModel.isSearchFieldInFocus
        }
    }
}

private extension SearchView {
    
    @ViewBuilder
    var navigationBar: some View {
        ZStack(alignment: .top) {
            HStack(alignment: .bottom, spacing: 16) {
                Image(systemName: "chevron.left")
                    .frameAsIcon()
                    .onTapGesture {
                        viewModel.didTapBackButton()
                    }
                
                Spacer()
                
                Image(systemName: "trash")
                    .frameAsIcon()
                    .onTapGesture {
                        viewModel.didTapDeleteButton()
                    }
            }
            .frame(height: 60)
            
            SearchField($viewModel.searchText, isSearchFieldInFocus: _isSearchFieldInFocus, isEditing: viewModel.isEditing)
                .frame(height: 60, alignment: viewModel.isEditing ? .top : .center)
                .padding(.horizontal, viewModel.isEditing ? 0 : (40 + 16))
                .padding(.top, viewModel.isEditing ? 60 : 0)
        }
    }
    
    var resultsList: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 4) {
                if viewModel.isActivityRunning {
                    activityCell
                }
                
                if let error = viewModel.error {
                    SearchErrorCell(error: error) {
                        isSearchFieldInFocus = false
                    }
                    .id(error.id)
                }
                
                ForEach(viewModel.results, id: \.self) { result in
                    LocationCell(location: result)
                        .onTapGesture {
                            isSearchFieldInFocus = false
                            viewModel.didTapLocationCell(location: result)
                        }
                        .id(result)
                }
                
                if !viewModel.previousResults.isEmpty {
                    if !viewModel.results.isEmpty {
                        Rectangle()
                            .fill(.gray)
                            .frame(height: 1)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                    }
                    
                    ForEach(viewModel.previousResults, id: \.self) { result in
                        LocationCell(location: result)
                            .onTapGesture {
                                isSearchFieldInFocus = false
                                viewModel.didTapLocationCell(location: result)
                            }
                            .id(result)
                    }
                }
                
                if viewModel.results.isEmpty && viewModel.previousResults.isEmpty {
                    LocationCell(location: "Your search results will appear here", isPlaceholder: true)
                }
            }
            .padding(.bottom, UIScreen.main.bottomUnsafePadding + 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.top, 8 + UIScreen.main.topUnsafePadding + 60 + (viewModel.isEditing ? 60 : 0))
        }
    }
    
    var activityCell: some View {
        HStack {
            Spacer()
            
            ProgressView()
                .preferredColorScheme(.dark)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 50)
        .background(BlurredView(style: .light))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            SearchView(viewModel: .init())
        }
        .previewMultipleDevices([.iPhone11, .iPhone14Pro])
    }
}
