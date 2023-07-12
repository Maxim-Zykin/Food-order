//
//  CartModelViewCell.swift
//  Food order
//
//  Created by Максим Зыкин on 11.07.2023.
//

import Foundation

protocol CartModelViewCellProtocol {
    var dishName: String { get }
    var dishImade: Data? { get }
    var dishPrice: String { get }
    var dishWeight: String { get }
    var dishCount: Int { get }
    init(dishesCart: ModelCart)
}

class CartModelViewCell: CartModelViewCellProtocol {
   
    var dishWeight: String {
        String("\(dishes.dishWeight)")
    }
    
    var dishCount: Int {
        dishes.dishCount
    }
    
    var dishPrice: String {
        String("\(dishes.dishPrice)")
    }
    
    var dishName: String {
        dishes.dishName
    }
    
    var dishImade: Data? {
        ImageManager.shared.fetchImage(from: dishes.imageUrl)
    }
    
    private var dishes: ModelCart
    
    required init(dishesCart: ModelCart) {
        self.dishes = dishesCart
    }
}
