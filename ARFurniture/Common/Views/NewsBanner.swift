//
//
// NewsBanner.swift
// ARFurniture
//
// Created by sturdytea on 14.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct NewsBanner: View {
    var imageName: String
    
    init(_ imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width - 32)
            .cornerRadius(14)
            .padding(.bottom, 16)
    }
}

#Preview {
    NewsBanner("news_banner_1")
}
