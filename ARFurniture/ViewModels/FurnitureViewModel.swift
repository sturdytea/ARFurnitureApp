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

enum FurnitureTypes: String, Codable, CaseIterable {
    case all = "All"
    case chair = "Chair"
    case table = "Table"
}

class FurnitureViewModel: ObservableObject {
    var furnitures: [FurnitureModel] = [
        FurnitureModel(id: 0, modelName: "chair_swan.usdz", name: "Chair Swan", price: 19.9, description: "This sleek, modern chair is crafted from durable, high-quality plastic and designed in a bold red color, making it a statement piece in any room. Inspired by the elegance of a swan, its smooth, curved lines and ergonomic design provide both style and comfort.\n\nIdeal for contemporary living spaces, home offices, or patios, this lightweight chair is easy to move and adds a pop of color wherever it's placed. Its sturdy construction ensures longevity, and the molded plastic surface is simple to clean, making it a practical choice for busy households or workspaces.", type: "Chair"),
        FurnitureModel(id: 1, modelName: "arm_chair.usdz", name: "Arm Chair", price: 45.5, description: "This charming, old-fashioned armchair brings timeless elegance to any space. Upholstered in rich, textured fabric and featuring classic details like tufted buttons, rolled arms, and carved wooden legs, it exudes a cozy, vintage appeal.\n\nThe deep seat and generously padded cushions ensure a comfortable lounging experience, perfect for a reading nook, study, or living room. With its sturdy frame and durable materials, this armchair is crafted to be as enduring as it is beautiful, adding a touch of sophistication and a sense of nostalgia to your decor.", type: "Chair"),
        FurnitureModel(id: 4, modelName: "futuristic_chair.usdz", name: "Futuristic Chair", price: 210, description: "Step into the future with this ultra-modern lounge chair, designed for those who seek innovation and style. With its unique geometric shape, smooth curves, and sleek materials, this chair brings a high-tech aesthetic to any space.\n\nCrafted from lightweight, durable materials, it often combines metal and synthetic elements for a glossy, polished look. The ergonomic design ensures maximum comfort, while the bold, minimalistic structure complements contemporary interiors.\n\nPerfect for home offices, living rooms, or creative studios, this chair makes a powerful statement and provides a glimpse into the future of modern furniture.", type: "Chair"),
        FurnitureModel(id: 11, modelName: "office_chair_2.usdz", name: "Office Chair", price: 150, description: "This classic black leather office chair combines style, comfort, and functionality, making it a staple for any professional workspace.\n\nUpholstered in premium, soft leather, it features plush padding, lumbar support, and adjustable settings to provide personalized comfort throughout the workday. The high backrest and cushioned armrests promote proper posture, reducing strain during long hours at a desk.\n\nA sturdy metal frame and smooth-rolling casters offer durability and easy mobility. This chair’s sleek design and timeless appeal make it a perfect addition to both home offices and corporate settings.", type: "Chair"),
        FurnitureModel(id: 11, modelName: "floor_lamp_holding_sun.usdz", name: "Floor Lamp 'Holding Sun'", price: 210, description: "This classic black leather office chair combines style, comfort, and functionality, making it a staple for any professional workspace.\n\nUpholstered in premium, soft leather, it features plush padding, lumbar support, and adjustable settings to provide personalized comfort throughout the workday. The high backrest and cushioned armrests promote proper posture, reducing strain during long hours at a desk.\n\nA sturdy metal frame and smooth-rolling casters offer durability and easy mobility. This chair’s sleek design and timeless appeal make it a perfect addition to both home offices and corporate settings.", type: "Chair"),
    ]
    
    @Published var searchText = ""
    @Published var suggestions = ["Industrial", "Table", "Coffee", "Chair", "Office"]
    
    var filteredFurniture: [FurnitureModel] {
        guard !searchText.isEmpty else { return furnitures }
        return furnitures.filter { furniture in
            furniture.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var recommendedFurniture: [FurnitureModel] {
        return furnitures.filter { furniture in
            furniture.isRecommended == true
        }
    }
}
