//
//
// HorizontalFilterView.swift
// ARFurniture
//
// Created by sturdytea on 08.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct HorizontalFilterView: View {
    @EnvironmentObject var viewModel: FurnitureViewModel
    let types: [FurnitureTypes] = FurnitureTypes.allCases
    @Binding var selectedType: FurnitureTypes
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(types, id: \.self) { type in
                    VStack {
                        Text("\(type.rawValue)")
                            .font(.custom("Lufga-Regular", size: 16))
                            .tag(type)
                            .onTapGesture {
                                selectedType = type
                            }
                            .foregroundStyle(selectedType == type ? .accent : .textPrimary)
                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundStyle(selectedType == type ? .accent : .backgroundPrimary)
                    }
                    .padding(.trailing, 32)
                }
            }
        }
        .padding(.bottom, 16)
    }
}
