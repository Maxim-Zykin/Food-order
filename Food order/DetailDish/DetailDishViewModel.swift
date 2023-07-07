//
//  DetailDishViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 06.07.2023.
//

import Foundation

protocol DetailDishViewModelProtocol: AnyObject {
    var dishName: String { get }
    var dishImade: Data? { get }
    var dishPrice: String { get }
    var dishDescription: String { get }
    var dishWeight: String { get } 
//    var dishTegs: [String] { get }
    init(dishes: Dishes)
}

class DetailDishViewModel: DetailDishViewModelProtocol {
    
    var dishName: String {
        "---\(dishes.name)"
    }
    
    var dishImade: Data? {
        ImageManager.shared.fetchImage(from: dishes.imageUrl)
    }
    
    var dishPrice: String {
        String(dishes.price)
    }
    
    var dishDescription: String {
        dishes.description
    }
    
    var dishWeight: String {
        String(dishes.weight)
    }
    
    private let dishes: Dishes
    
    required init(dishes: Dishes) {
        self.dishes = dishes
    }
    
    
}
