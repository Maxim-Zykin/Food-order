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
    func addCart()
//    var dishTegs: [String] { get }
    init(dishes: Dishes)
}

class DetailDishViewModel: DetailDishViewModelProtocol {
    
    var dishName: String {
        "\(dishes.name)"
    }
    
    var dishImade: Data? {
        ImageManager.shared.fetchImage(from: dishes.imageUrl)
    }
    
    var dishPrice: String {
        String("\(dishes.price) ₽")
    }
    
    var dishDescription: String {
        dishes.description
    }
    
    var dishWeight: String {
        String("· \(dishes.weight)г")
    }
    
    private let dishes: Dishes
    
    func addCart() {
        let dish = ModelCart(dishName: self.dishName, dishPrice: self.dishPrice, dishCount: 1, imageUrl: self.dishes.imageUrl, dishWeight: self.dishWeight)
        print(dish.dishName)
        dishCart.append(dish)
    }
    
    required init(dishes: Dishes) {
        self.dishes = dishes
    }
    
    
}
