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
    var scene: SCNScene?
    
    init(modelName: String, name: String, price: Double) {
        self.modelName = modelName
        self.name = name
        self.price = price
        self.scene = SCNScene(named: modelName)
        let angleInRadians = Float.pi / 16
        let _ = scene?.background.contents = UIColor(.backgroundPrimary)
        let _ = scene?.rootNode.rotation = SCNVector4(x: 0, y: -1, z: 0, w: angleInRadians)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SceneView(scene: scene, options: [.autoenablesDefaultLighting])
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
