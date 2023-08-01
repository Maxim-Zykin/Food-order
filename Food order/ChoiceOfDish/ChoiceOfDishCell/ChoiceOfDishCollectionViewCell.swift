//
//  ChoiceOfDishCollectionViewCell.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import UIKit

class ChoiceOfDishCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    
    var viewModel: ChoiceOfDishCellViewModelProtocol! {
        didSet {
            self.dishNameLabel.text = viewModel.dishName
            DispatchQueue.global().async {
                guard let imageData = self.viewModel.dishImade else { return }
                DispatchQueue.main.async {
                    self.dishImage.image = UIImage(data: imageData)
                }
           }
        }
    }
}
