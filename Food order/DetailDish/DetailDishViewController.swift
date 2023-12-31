//
//  DetailDishViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 06.07.2023.
//

import UIKit

class DetailDishViewController: UIViewController {
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var nameDish: UILabel!
    @IBOutlet weak var priseDishLabel: UILabel!
    @IBOutlet weak var dishWeightLabel: UILabel!
    @IBOutlet weak var descriptionDishLabel: UILabel!
    
    var viewModel: DetailDishViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        nameDish.text = viewModel.dishName
        priseDishLabel.text = viewModel.dishPrice
        dishWeightLabel.text = viewModel.dishWeight
        descriptionDishLabel.text = viewModel.dishDescription
        DispatchQueue.global().async {
            guard let imageData = self.viewModel.dishImade else { return }
            DispatchQueue.main.async {
                self.dishImage.image = UIImage(data: imageData)
            }
        }
    }
    
    @IBAction func addCart(_ sender: Any) {
        viewModel.addCart()
        //print(dishCart.count)
        AlertManager.alertAddCart(on: self)
    }
    
}
