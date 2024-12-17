//
//
// FurnitureError.swift
// ARFurniture
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

enum FurnitureError: Error {
    case network, parsing, fetching
    
    var description: String {
        switch self {
        case .network: "Network error"
        case .parsing: "Parsing error"
        case .fetching: "File fetching error"
        }
    }
}
