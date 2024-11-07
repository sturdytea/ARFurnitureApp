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
    var index: Int
    @ObservedObject var viewModel: FurnitureViewModel
    var scene: SCNScene?
    
    init(_ index: Int) {
        self.index = index
        self.viewModel = FurnitureViewModel()
        self.scene = SCNScene(named: viewModel.furnitures[index].modelName)
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
                    Text(viewModel.furnitures[index].name)
                        .font(.custom("Lufga-Bold", size: 24, relativeTo: .title))
                        .foregroundStyle(.textPrimary)
                    Spacer()
                    Text(String("$\(viewModel.furnitures[index].price)"))
                        .font(.custom("Lufga-Medium", size: 24, relativeTo: .title))
                        .foregroundStyle(.accent)
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Text(viewModel.furnitures[index].description)
                    .font(.custom("Lufga-Regular", size: 14, relativeTo: .body))
                    .foregroundStyle(.textSecondary)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 0))
            NavigationLink {
                ARCameraView(viewModel.furnitures[index].modelName)
            } label: {
                FilledButton("Show in AR")
            }
        }
        .background(Color.backgroundPrimary)
    }
}

#Preview {
    DetailsView(0)
}
