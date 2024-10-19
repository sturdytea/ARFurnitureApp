//
//
// FurnitureViewModel.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

class FurnitureViewModel: ObservableObject {
    var furnitures: [FurnitureModel] = [
        FurnitureModel(id: 0, modelName: "chair_swan.usdz", name: "Chair Swan", price: 199, description: "Simple plastic chair", tag: "chair"),
        FurnitureModel(id: 1, modelName: "arm_chair.usdz", name: "Arm Chair", price: 39.9, description: "Old classic chair", tag: "chair")
    ]
}
