//
//
// FurnitureService.swift
// ARFurniture
//
// Created by sturdytea on 17.12.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation
import Combine

class FurnitureService: ObservableObject {
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "API Key"
    private let session: URLSession
    private var subscriptions = Set<AnyCancellable>()
    private let base = "https://dummyjson.com/c/"
    private lazy var decoder = JSONDecoder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func furniturePublisher() -> AnyPublisher<FurnitureResponseBody, Error> {
        guard let url = URL(string: "\(base)\(apiKey)") else {
            return Fail(error: FurnitureError.network).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FurnitureResponseBody.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
