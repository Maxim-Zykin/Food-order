//
//  DeliveryCategoryCollectionViewCellViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

protocol DeliveryCategoryCellViewModelProtocol {
    var name: String { get }
    var image: Data? { get }
    init(category: Сategory)
}

class DeliveryCategoryCellViewModel: DeliveryCategoryCellViewModelProtocol {
    
    var name: String {
        category.name
    }
    
    var image: Data? {
        ImageManager.shared.fetchImage(from: category.imageUrl)
    }
    
    private var category: Сategory
    
    required init(category: Сategory) {
        self.category = category
    }

    
    
}
