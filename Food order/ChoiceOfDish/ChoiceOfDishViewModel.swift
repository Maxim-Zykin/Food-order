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
    
    private let apiDishes = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    
    func fetchDish(completion: @escaping () -> Void) {
        NetworkManager<GroupDish>.fetchData(urlJSON: apiDishes) { (result) in
            switch result {
            case .success(let response):
                self.dishes = response.dishes
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func fetchDish(completion: @escaping () -> Void) {
//        NetworkManager.shared.fetchDataDish { [weak self] dishes in
//            self?.dishes = dishes
//            completion()
//        }
//    }
    
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
