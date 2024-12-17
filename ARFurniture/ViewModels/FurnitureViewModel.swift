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
    case table = "Lamp"
    case decorations = "Decorations"
}

class FurnitureViewModel: ObservableObject {
    var furnitures: [FurnitureModel] = [
        FurnitureModel(id: 0, modelName: "chair_swan.usdz", name: "Chair Swan", price: 20, description: "This sleek, modern chair is crafted from durable, high-quality plastic and designed in a bold red color, making it a statement piece in any room. Inspired by the elegance of a swan, its smooth, curved lines and ergonomic design provide both style and comfort.\n\nIdeal for contemporary living spaces, home offices, or patios, this lightweight chair is easy to move and adds a pop of color wherever it's placed. Its sturdy construction ensures longevity, and the molded plastic surface is simple to clean, making it a practical choice for busy households or workspaces.", type: "Chair"),
        
        FurnitureModel(id: 1, modelName: "arm_chair.usdz", name: "Arm Chair", price: 45.5, description: "This charming, old-fashioned armchair brings timeless elegance to any space. Upholstered in rich, textured fabric and featuring classic details like tufted buttons, rolled arms, and carved wooden legs, it exudes a cozy, vintage appeal.\n\nThe deep seat and generously padded cushions ensure a comfortable lounging experience, perfect for a reading nook, study, or living room. With its sturdy frame and durable materials, this armchair is crafted to be as enduring as it is beautiful, adding a touch of sophistication and a sense of nostalgia to your decor.", type: "Chair"),
        
        FurnitureModel(id: 11, modelName: "floor_lamp_holding_sun.usdz", name: "Floor Lamp 'Holding Sun'", price: 210, description: "The 'Holding Sun' floor lamp is an artistic and functional masterpiece that blends modern sculpture with elegant lighting. Its sleek, black humanoid form stands gracefully, offering an array of soft, glowing orbs that resemble captured suns. The high-quality matte black finish enhances its contemporary aesthetic, while the glowing spheres emit a warm and soothing light, perfect for creating a cozy atmosphere in any space. \n\nIdeal for living rooms, lounges, or art-inspired interiors, the 'Holding Sun' lamp serves both as a statement piece and a source of ambient lighting. This floor lamp is perfect for those who appreciate the harmony of art and design in their home decor.n\nKey Features:\n  - Unique sculptural design with modern elegance\n  - Soft, diffused lighting from multiple orbs\n  - Sturdy base for stability\n  - High-quality black matte finish\n  - Perfect for contemporary interiors or artful spaces\n\nEnhance your home with this striking blend of light and art.", type: "Lamp", isRecommended: true),
        
        FurnitureModel(id: 4, modelName: "futuristic_chair.usdz", name: "Futuristic Chair", price: 170, description: "Step into the future with this ultra-modern lounge chair, designed for those who seek innovation and style. With its unique geometric shape, smooth curves, and sleek materials, this chair brings a high-tech aesthetic to any space.\n\nCrafted from lightweight, durable materials, it often combines metal and synthetic elements for a glossy, polished look. The ergonomic design ensures maximum comfort, while the bold, minimalistic structure complements contemporary interiors.\n\nPerfect for home offices, living rooms, or creative studios, this chair makes a powerful statement and provides a glimpse into the future of modern furniture.", type: "Chair"),
        
        FurnitureModel(id: 11, modelName: "modern_floor_lamp.usdz", name: "Modern Floor Lamp", price: 95, description: "Sleek, minimalistic, and functional, the Modern Floor Lamp is the epitome of contemporary design. Its slim, matte black frame and cylindrical head create a clean and refined silhouette that complements any modern interior. The angled neck allows for focused illumination, making it an ideal choice for reading nooks, workspaces, or living areas.\n\nCrafted for both style and utility, this floor lamp delivers targeted lighting while adding a sophisticated touch to your home. Its sturdy circular base ensures stability, while the slim profile saves space, making it perfect for small apartments or minimalist setups.\n\nKey Features:\n  - Minimalistic matte black design\n  - Adjustable angled head for focused lighting\n  - Slim and space-saving frame\n  - Sturdy circular base for stability\n  - Ideal for reading, working, or accent lighting\n\nIlluminate your space with modern simplicity and functional elegance.", type: "Lamp"),
        
        FurnitureModel(id: 11, modelName: "modern_stool_ottoman.usdz", name: "Modern Stool 'Ottoman'", price: 35.95, description: "The Modern Ottoman Stool combines luxurious comfort with contemporary elegance. Its plush, tufted cushion, wrapped in soft grey upholstery, invites relaxation while exuding sophistication. The sleek chrome-finished X-shaped base adds a touch of modern flair, ensuring stability and style in equal measure.\n\nPerfect as a footrest, extra seating, or a decorative accent, this versatile piece enhances living rooms, bedrooms, or office spaces. Its clean design makes it a seamless addition to modern, minimalist, or industrial interiors.\n\nKey Features:\n  - Soft tufted cushion for premium comfort\n  - Stylish grey upholstery with a timeless look\n  - Sturdy chrome-finished X-frame base\n  - Multi-purpose: footrest, seating, or accent piece\n  - Ideal for modern and contemporary interiors\n\nUpgrade your space with the perfect blend of comfort and style.", type: "Chair"),
        
        FurnitureModel(id: 11, modelName: "monstera_flower_pot.usdz", name: "'Monstera' Flower Pot", price: 40, description: "Elevate your greenery with the 'Monstera' Flower Pot, a stunning piece designed to complement modern and natural spaces alike. Featuring a sleek, minimalist silhouette, this pot provides the perfect home for your indoor plants. Its clean design beautifully highlights the iconic Monstera plant, making it a statement piece for living rooms, offices, or cozy corners.\n\nCrafted for durability and style, the 'Monstera' pot blends effortlessly with contemporary, Scandinavian, or boho-inspired interiors. Whether placed on the floor or a plant stand, it brings life and elegance to any environment.\n\nKey Features: \n  - Sleek and minimalist design\n  - Perfectly suited for Monstera plants or other houseplants\n  - Durable construction for long-lasting use\n  - Ideal for living rooms, offices, or modern spaces \n  - A stylish accent that enhances any decor\n\nBring nature indoors with the timeless charm of the 'Monstera' Flower Pot.", type: "Decorations", isRecommended: true),
        
        FurnitureModel(id: 11, modelName: "office_chair_2.usdz", name: "Office Chair", price: 150, description: "This classic black leather office chair combines style, comfort, and functionality, making it a staple for any professional workspace.\n\nUpholstered in premium, soft leather, it features plush padding, lumbar support, and adjustable settings to provide personalized comfort throughout the workday. The high backrest and cushioned armrests promote proper posture, reducing strain during long hours at a desk.\n\nA sturdy metal frame and smooth-rolling casters offer durability and easy mobility. This chair’s sleek design and timeless appeal make it a perfect addition to both home offices and corporate settings.", type: "Chair", isRecommended: true),
    ]
    
    @Published var searchText = ""
    @Published var suggestions = ["Table", "Coffee", "Chair", "Office", "Lamp", "Decorations"]
    
    var filteredFurnitures: [FurnitureModel] {
        guard !searchText.isEmpty else { return furnitures }
        return furnitures.filter { furniture in
            furniture.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    var recommendedFurnitures: [FurnitureModel] {
        return furnitures.filter { furniture in
            furniture.isRecommended == true
        }
    }
}
