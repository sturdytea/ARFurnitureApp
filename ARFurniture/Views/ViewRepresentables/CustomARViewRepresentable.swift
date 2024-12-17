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
import FocusEntity
import Combine

enum ARActions {
    case placeModel, removeModel
}

struct CustomARViewRepresentable: UIViewRepresentable {
    @Binding var modelName: String
    
    func makeUIView(context: Context) -> ARView {
        let view = CustomARView(model: modelName)
        return view
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
}

class CustomARView: ARView {
    var focusEntity: FocusEntity?
    var modelName: String?
    var defaultModel = "chair_swan.usdz"
    var cancellables: Set<AnyCancellable> = []
    
    init(model modelName: String) {
        super.init(frame: .zero)
        self.modelName = modelName
        subscribeToActionStream()
        setupFocusEntity()
        setupView()
    }
    
    @MainActor @preconcurrency required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @MainActor @preconcurrency required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    func setupView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification) {
            config.sceneReconstruction = .meshWithClassification
        }
        self.session.run(config)
    }
    
    func setupFocusEntity() {
        self.focusEntity = FocusEntity(on: self, style: .classic(color: UIColor(Color.accent)))
    }
    
    func placeModel() {
        guard let focusEntity = self.focusEntity else { return }
        let modelEntity = try! ModelEntity.load(named: modelName ?? defaultModel)
        let anchorEntity = AnchorEntity(world: focusEntity.position)
        anchorEntity.addChild(modelEntity)
        self.scene.addAnchor(anchorEntity)
    }
    
    func subscribeToActionStream() {
        ActionManager.shared
            .actionStream
            .sink { [weak self] action in
                switch action {
                case .placeModel:
                    self?.placeModel()
                case .removeModel:
                    print("Removing is not impleneted yet") // TODO: Implement object removing function
                }
                
            }
            .store(in: &cancellables)
    }
}

class ActionManager {
    static let shared = ActionManager()
    
    private init() { }
    
    var actionStream = PassthroughSubject<ARActions, Never>()
}
