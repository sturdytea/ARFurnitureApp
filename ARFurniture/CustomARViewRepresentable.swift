//
//
// CustomARViewRepresentable.swift
// ARFurniture
//
// Created by sturdytea on 19.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI
import RealityKit
import ARKit

struct CustomARViewRepresentable: UIViewRepresentable {
    @Binding var modelName: String
    
    // TODO: Correct model positioning
    func makeUIView(context: Context) -> ARView {
        let view = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification) {
            config.sceneReconstruction = .meshWithClassification
        }
        
        view.session.run(config)
        return view
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let anchorEntity = AnchorEntity()
        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
        anchorEntity.addChild(modelEntity)
        uiView.scene.addAnchor(anchorEntity)
    }
}
