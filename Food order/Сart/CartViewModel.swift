//
//  CartViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 11.07.2023.
//

import Foundation

protocol CartViewModelProtocol {
    var dishesCart: [ModelCart] { get }
    func сorData() -> String
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CartModelViewCellProtocol
}

class CartViewModel: CartViewModelProtocol {
    
    var dishesCart: [ModelCart] = dishCart
    
    func сorData() -> String {
        let mytime = Date()
        let format = DateFormatter()
        format.dateStyle = .long
        let сorrectData = (format.string(from: mytime))
        return сorrectData
    }
    
    func numberOfRows() -> Int {
        dishesCart.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CartModelViewCellProtocol {
        let dishesCart = dishesCart[indexPath.row]
        return CartModelViewCell(dishesCart: dishesCart)
    }
    
}
