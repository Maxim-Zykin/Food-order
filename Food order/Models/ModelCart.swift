//
//  ModelCart.swift
//  Food order
//
//  Created by Максим Зыкин on 11.07.2023.
//

import Foundation

struct ModelCart: Codable {
    var dishName: String
    var dishPrice: String
    var dishCount: Int
    var imageUrl: URL
    var dishWeight: String
}

var dishCart: [ModelCart] = []
