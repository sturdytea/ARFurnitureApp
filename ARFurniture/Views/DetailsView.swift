//
//
// DetailsView.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI
import SceneKit

struct DetailsView: View {
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
        VStack {
            VStack(alignment: .leading) {
                SceneView(scene: scene, options: [.allowsCameraControl, .autoenablesDefaultLighting])
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                HStack {
                    Text(furniture.name)
                        .font(.custom("Lufga-Bold", size: 24, relativeTo: .title))
                        .foregroundStyle(.textPrimary)
                    Spacer()
                    Text(String("$\(furniture.price)"))
                        .font(.custom("Lufga-Medium", size: 24, relativeTo: .title))
                        .foregroundStyle(.accent)
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Text(furniture.description)
                    .font(.custom("Lufga-Regular", size: 14, relativeTo: .body))
                    .foregroundStyle(.textSecondary)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 0))
            NavigationLink {
                ARCameraView(furniture.modelName)
            } label: {
                FilledButton(LocalizedContent.openCamera)
            }
        }
        .background(Color.backgroundPrimary)
    }
}
