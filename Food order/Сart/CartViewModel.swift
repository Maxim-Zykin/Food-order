//
//  CartViewModel.swift
//  Food order
//
//  Created by Максим Зыкин on 11.07.2023.
//

import Foundation

protocol CartViewModelProtocol {
   // var dishesCart: [ModelCart] { get }
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CartModelViewCellProtocol
    func checkout()
}

class CartViewModel: CartViewModelProtocol {
    
    //var dishesCart: [ModelCart] = dishCart

    func numberOfRows() -> Int {
        dishCart.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CartModelViewCellProtocol {
        let dishesCart = dishCart[indexPath.row]
        return CartModelViewCell(dishesCart: dishesCart)
    }
    
    func checkout() {
        dishCart.removeAll()
        print(dishCart.count)
    }
}
