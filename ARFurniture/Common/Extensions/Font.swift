//
//
// Font.swift
// ARFurniture
//
// Created by sturdytea on 19.11.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import SwiftUI

extension Font {
    private static let fontName = "Lufga"

    private enum Style: String {
        case regular = "-Regular"
        case medium = "-Medium"
        case semibold = "-SemiBold"
        case bold = "-Bold"
    }
    
    static let button = Font.custom("Lufga-Regular", size: 17)
}
