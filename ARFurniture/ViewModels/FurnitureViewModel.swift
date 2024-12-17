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
import Combine

final class FurnitureViewModel: ObservableObject {
    private var furnitureService = FurnitureService()
    private var subscriptions = Set<AnyCancellable>()
    @Published var furnitures: [FurnitureModel] = []
    @Published var searchText = ""
    @Published var suggestions = ["Table", "Coffee", "Chair", "Office", "Lamp", "Decorations"]
    
    init() {
        fetchFurnitures()
    }
    
    private func fetchFurnitures() {
        furnitureService.furniturePublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("fetchFurnitures(): Completion finished successfully")
                case .failure(let error):
                    print("Error: fetchFurnitures() \(error)")
                }
            }, receiveValue: { value in
                self.furnitures.removeAll()
                let list = value.furnitures
                    .map({ item in
                        FurnitureModel(item)
                        
                    })
                self.furnitures.append(contentsOf: list)
            })
            .store(in: &subscriptions)
    }
    
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
