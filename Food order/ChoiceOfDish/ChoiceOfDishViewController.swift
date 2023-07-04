//
//  ChoiceOfDishViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import UIKit

class ChoiceOfDishViewController: UIViewController {

    @IBOutlet weak var dishCollection: UICollectionView!
    
    private var viewModel: ChoiceOfDishViewModelProtocol! {
        didSet {
            viewModel.fetchDish {
                self.dishCollection.reloadData()
            }
        }
    }
    
    var titleCategory: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishCollection.layer.cornerRadius = 10
        viewModel = ChoiceOfDishViewModel()
        navigationItem.title = titleCategory
    }
}


extension ChoiceOfDishViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellDish", for: indexPath) as! ChoiceOfDishCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    
}
