//
//  DeliveryCategoryCollectionViewCell.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import UIKit

class DeliveryCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLanel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    var viewModel: DeliveryCategoryCellViewModelProtocol! {
        didSet {
            self.categoryLanel.text = viewModel.name
            guard let imageData = viewModel.image else { return }
            self.categoryImage.image = UIImage(data: imageData)
        }
    }
}
