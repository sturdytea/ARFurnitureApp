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
            VStack(alignment: .leading) {
                HorizontalFilterView(selectedType: $selectedType)
                    .environmentObject(viewModel)
                Text("For You")
                    .font(.custom("Lufga-Regular", size: 18, relativeTo: .title2))
                    .foregroundStyle(.textPrimary)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.furnitures.filter({ furniture in
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
                .frame(height: UIScreen.main.bounds.height / 4)
            }
            .padding()
            .frame(maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.backgroundPrimary)
        }
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
