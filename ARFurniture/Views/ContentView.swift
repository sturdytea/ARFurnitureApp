//
//
// ContentView.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: FurnitureViewModel
    @State var selectedType = FurnitureTypes.all
    
    init() {
        viewModel = FurnitureViewModel()
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    // MARK: - For You
                    Text(LocalizedContent.forYouTitle)
                        .font(.custom("Lufga-Regular", size: 18, relativeTo: .title2))
                        .foregroundStyle(.textPrimary)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.recommendedFurniture, id: \.self) { furniture in
                                NavigationLink {
                                    DetailsView(furniture)
                                } label: {
                                    ListingItem(furniture)
                                }
                            }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 4)
                    
                    // MARK: - New
                    NewsBanner("NewsBanner")
                    
                    // MARK: - More offers
                    HorizontalFilterView(selectedType: $selectedType)
                        .environmentObject(viewModel)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 3))], spacing: 16) {
                        ForEach(viewModel.filteredFurniture.filter({ furniture in
                            filterType(furniture)
                        }), id: \.self) { furniture in
                            NavigationLink {
                                DetailsView(furniture)
                            } label: {
                                ListingItem(furniture)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxHeight: .infinity)
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.backgroundPrimary)
            }
        }
        .searchable(text: $viewModel.searchText, suggestions: {
            ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                Button {
                    viewModel.searchText = suggestion
                } label: {
                    Label(suggestion, systemImage: "magnifyingglass")
                }
            }
        })
    }
    
    // MARK: Filter helper
    private func filterType(_ furniture: FurnitureModel) -> Bool {
        if selectedType == FurnitureTypes.all || selectedType.rawValue == furniture.type {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    ContentView()
}
