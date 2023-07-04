//
//  ChoiceOfDishCellViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import Foundation

protocol ChoiceOfDishCellViewModelProtocol {
    var dishName: String { get }
    var dishImade: Data? { get }
    init(dishes: Dishes)
}

class ChoiceOfDishCellViewModel: ChoiceOfDishCellViewModelProtocol {
   
    var dishName: String {
        dishes.name
    }
    
    var dishImade: Data? {
        ImageManager.shared.fetchImage(from: dishes.imageUrl)
    }
    
    private var dishes: Dishes
    
    required init(dishes: Dishes) {
        self.dishes = dishes
    }
    
    
}
