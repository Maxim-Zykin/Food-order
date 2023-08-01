//
//  ChoiceOfDishViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import Foundation

protocol ChoiceOfDishViewModelProtocol {
    var dishes: [Dishes] { get }
    func fetchDish(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> ChoiceOfDishCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailDishViewModelProtocol
}

class ChoiceOfDishViewModel: ChoiceOfDishViewModelProtocol {
    
    var dishes: [Dishes] = []
    
    func fetchDish(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchDataDish { [weak self] dishes in
            self?.dishes = dishes
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        dishes.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ChoiceOfDishCellViewModelProtocol {
        let dishes = dishes[indexPath.row]
        return ChoiceOfDishCellViewModel(dishes: dishes)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailDishViewModelProtocol {
        let dishes = dishes[indexPath.row]
        return DetailDishViewModel(dishes: dishes)
    }
}
