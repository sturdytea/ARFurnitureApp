//
//
// FilledButton.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct FilledButton: View {
    let buttonText: String
    let modelName: String?
    
    init(_ text: String, modelName: String?) {
        self.buttonText = text
        self.modelName = modelName
    }
    
    var body: some View {
            NavigationLink {
                ARCameraView(modelName ?? "")
            } label: {
                Text(buttonText)
                    .font(.custom("Lufga-Regular", size: 17))
                    .padding(16)
            }
            .frame(width: UIScreen.main.bounds.width - 16, height: 50, alignment: .center)
            .background(Color.accentColor)
            .cornerRadius(12)
            .foregroundColor(Color.backgroundPrimary)
        }
}

#Preview {
    FilledButton("Next", modelName: "chair_swan.usdz")
}
