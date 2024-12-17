//
//
// FurnitureResponseBody.swift
// ARFurniture
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct FurnitureResponseBody: Decodable {
    let furnitures: [FurnitureResponse]
}

struct FurnitureResponse: Decodable {
    let id: Int
    let modelName: String
    let name: String
    let price: Double
    let description: String
    let type: String
    let isRecommended: Bool
}
