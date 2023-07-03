//
//  ModelDish.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import Foundation

struct GroupDish: Codable {
    let сategories: [Dishes]
}

struct Dishes: Codable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageUrl: URL
    let tegs: [String]
}
