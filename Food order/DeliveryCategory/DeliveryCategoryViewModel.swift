//
//  DeliveryCategoryViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

protocol DeliveryCategoryViewModelProtocol {
    var category: [Сategory] { get }
    func сorData() -> String
    func fetchCategoru(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol
    //func viewModelForSelectedRow(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol
}

class DeliveryCategoryViewModel: DeliveryCategoryViewModelProtocol {

    var category: [Сategory] = []
    
    func сorData() -> String {
        let mytime = Date()
        let format = DateFormatter()
        format.dateStyle = .long
        let сorrectData = (format.string(from: mytime))
        return сorrectData
    }
    
    func fetchCategoru(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [weak self] category in
            self?.category = category
            completion()
        }
    } 
    
    func numberOfRows() -> Int {
        category.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol {
        let category = category[indexPath.row]
        return DeliveryCategoryCellViewModel(category: category)
    }
    
//    func viewModelForSelectedRow(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol {
//        let category = category[indexPath.row]
//        return ChoiceOfDishViewModelProtocol
//    }

}
