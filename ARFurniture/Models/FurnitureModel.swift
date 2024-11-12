//
//
// FurnitureModel.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

struct FurnitureModel: Codable, Identifiable, Hashable {
    var id: Int
    var modelName: String
    var name: String
    var price: Double
    var description: String
    var type: String
    
    
    init(id: Int, modelName: String, name: String, price: Double, description: String, type: String) {
        self.id = id
        self.modelName = modelName
        self.name = name
        self.price = price
        self.description = description
        self.type = type
    }
}
