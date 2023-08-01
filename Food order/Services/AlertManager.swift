//
//  AlertManager.swift
//  Food order
//
//  Created by Максим Зыкин on 12.07.2023.
//

import Foundation
import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, and message: String?) {
       
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            vc.present(alert, animated: true)
        }
    }
}


extension AlertManager {
    public static func alertAddCart(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Добавлено", and: "")
    }
    
    public static func alertСheckout(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Спасибо за заказ", and: "Ваш заказ принят и отправлен на кухню.")
    }
    
    public static func alertNotСheckout(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Упс...", and: "Для заказа добавьте сначала в корзину")
    }
}
