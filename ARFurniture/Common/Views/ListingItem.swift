//
//
// ListingItem.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI
import SceneKit

struct ListingItem: View {
    var modelName: String
    var name: String
    var price: Double
    
    init(modelName: String, name: String, price: Double) {
        self.modelName = modelName
        self.name = name
        self.price = price
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Remove background
            // TODO: Rotate camera position
            SceneView(scene: SCNScene(named: modelName), /*pointOfView: cameraNode, */options: [.autoenablesDefaultLighting])
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .background(.clear)
            Text(name)
                .font(.custom("Lufga-Regular", size: 14))
                .foregroundStyle(.textSecondary)
            Text(String("$\(price)"))
                .font(.custom("Lufga-Regular", size: 10))
                .foregroundStyle(.accent)
        }
        .padding(16)
        .frame(height: 200)
    }
}

#Preview {
    ListingItem(modelName: "chair_swan.usdz", name: "Chair Swan", price: 199.95)
}
