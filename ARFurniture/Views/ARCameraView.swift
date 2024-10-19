//
//
// ARCameraView.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct ARCameraView: View {
    @State var modelName: String
    
    init(_ modelName: String) {
        self.modelName = modelName
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomARViewRepresentable(modelName: $modelName)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ARCameraView("chair_swan.usdz")
}
