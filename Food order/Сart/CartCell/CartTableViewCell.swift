//
//  CartTableViewCell.swift
//  Food order
//
//  Created by Максим Зыкин on 11.07.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var nameDishLabel: UILabel!
    @IBOutlet weak var priceDishLabel: UILabel!
    @IBOutlet weak var weightDishLabel: UILabel!
    
    var viewModel: CartModelViewCellProtocol! {
        didSet {
            DispatchQueue.global().async {
                guard let imageData = self.viewModel.dishImade else { return }
                DispatchQueue.main.async {
                    self.dishImage.image = UIImage(data: imageData)
                }
            }
            self.nameDishLabel.text = viewModel.dishName
            self.priceDishLabel.text = viewModel.dishPrice
            self.weightDishLabel.text = viewModel.dishWeight
        }
    }
}
