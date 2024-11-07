//
//
// CircleButton.swift
// ARFurniture
//
// Created by sturdytea on 19.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

struct CircleButton: View {
    let iconName: String
    let isSystemIcon: Bool
    let action: ()
    
    init(_ name: String, _ isSystemIcon: Bool = false, action: ()) {
        self.iconName = name
        self.isSystemIcon = isSystemIcon
        self.action = action
    }
    
    var body: some View {
        NavigationLink(destination: ContentView()) {
            HStack {
                if isSystemIcon {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 18, height: 18)
                } else {
                    Image(iconName)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
            }
            .frame(width: 44, height: 44)
            .background(Color.backgroundSecondary)
            .cornerRadius(100)
            .foregroundColor(Color.textPrimary)
        }
    }
}
