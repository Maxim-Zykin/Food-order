//
//  DeliveryCategoryViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

protocol DeliveryCategoryViewModelProtocol {
    var category: [Сategory] { get }
    func fetchCategoru(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol
}

class DeliveryCategoryViewModel: DeliveryCategoryViewModelProtocol {

    var category: [Сategory] = []
    
    private let apiCategory = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
    
    func fetchCategoru(completion: @escaping () -> Void) {
        NetworkManager<Group>.fetchData(urlJSON: apiCategory) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.category = response.сategories
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
//    func fetchCategoru(completion: @escaping () -> Void) {
//        NetworkManager.shared.fetchData { [weak self] category in
//            self?.category = category
//            completion()
//        }
//    }
    
    func numberOfRows() -> Int {
        category.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> DeliveryCategoryCellViewModelProtocol {
        let category = category[indexPath.row]
        return DeliveryCategoryCellViewModel(category: category)
    }
}
