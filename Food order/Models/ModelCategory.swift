//
//  ModelCategory.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

// MARK: - Group
struct Group: Codable {
    let сategories: [Сategory]
}

// MARK: - Сategory
struct Сategory: Codable {
    let id: Int
    let name: String
    let imageUrl: URL
}
