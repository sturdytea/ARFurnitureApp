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
    
    init() {
        viewModel = FurnitureViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("For You")
                        .font(.custom("Lufga-Regular", size: 18, relativeTo: .title2))
                        .foregroundStyle(.textPrimary)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<viewModel.furnitures.count, id: \.self) { index in
                            NavigationLink {
                                DetailsView(index)
                            } label: {
                                ListingItem(modelName: viewModel.furnitures[index].modelName, name: viewModel.furnitures[index].name, price: viewModel.furnitures[index].price)
                                if index < viewModel.furnitures.count - 1 {
                                    Divider().frame(width: 1)
                                        .frame(height: 154)
                                }
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
}

#Preview {
    ContentView()
}
