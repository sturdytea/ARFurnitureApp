//
//
// FurnitureProtocol.swift
// ARFurniture
//
// Created by sturdytea on 15.10.2024.
//
// GitHub: https://github.com/sturdytea
//
    

import Foundation

protocol FurnitureProtocol {
    var modelName: String { get }
    var name: String { get }
    var price: Double { get }
    var description: String { get }
    var tag: String { get }
}
