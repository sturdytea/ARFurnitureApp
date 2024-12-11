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
    
    init(_ text: String) {
        self.buttonText = text
    }
    
    var body: some View {
        Text(buttonText)
            .font(.button)
            .padding(16)
            .frame(width: UIScreen.main.bounds.width - 16, height: 50, alignment: .center)
            .background(Color.accent)
            .cornerRadius(12)
            .foregroundColor(Color.backgroundPrimary)
    }
}

#Preview {
    FilledButton("Next") 
}
