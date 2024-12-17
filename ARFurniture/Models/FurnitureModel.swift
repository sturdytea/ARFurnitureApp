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
import Combine

struct FurnitureModel: Hashable, Equatable {
    private let item: FurnitureResponse
    private var subscriptions = Set<AnyCancellable>()
    
    var id: Int {
        item.id
    }
    
    var modelName: String {
        item.modelName
    }
    
    var name: String {
        item.name
    }
    
    var price: Double {
        item.price
    }
    
    var description: String {
        item.description
    }
    
    var type: String {
        item.type
    }
    
    var isRecommended: Bool {
        item.isRecommended
    }
    
    init(_ item: FurnitureResponse) {
        self.item = item
    }
    
    static func ==(lhs: FurnitureModel, rhs: FurnitureModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
