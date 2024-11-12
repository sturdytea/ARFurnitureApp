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
    var furniture: FurnitureModel
    var scene: SCNScene?
    
    init(_ furniture: FurnitureModel) {
        self.furniture = furniture
        self.scene = SCNScene(named: furniture.modelName)
        let angleInRadians = Float.pi / 16
        let _ = scene?.background.contents = UIColor(.backgroundPrimary)
        let _ = scene?.rootNode.rotation = SCNVector4(x: 0, y: -1, z: 0, w: angleInRadians)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SceneView(scene: scene, options: [.autoenablesDefaultLighting])
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .background(.clear)
            Text(furniture.name)
                .font(.custom("Lufga-Regular", size: 14))
                .foregroundStyle(.textSecondary)
            Text(String("$\(furniture.price)"))
                .font(.custom("Lufga-Regular", size: 10))
                .foregroundStyle(.accent)
        }
        .padding(16)
        .frame(height: 200)
    }
}
