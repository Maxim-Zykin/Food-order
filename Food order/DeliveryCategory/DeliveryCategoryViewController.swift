//
//  DeliveryCategoryViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import UIKit

class DeliveryCategoryViewController: UIViewController {

    @IBOutlet weak var collectiovViewCategory: UICollectionView!
    
    private var viewModel: DeliveryCategoryViewModelProtocol! {
        didSet {
            viewModel.fetchCategoru {
                self.collectiovViewCategory.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DeliveryCategoryViewModel()
        viewModel.printCat()
        collectiovViewCategory.layer.cornerRadius = 10
    }
}

// MARK: - UICollectionViewDataSource

extension DeliveryCategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCategory", for: indexPath) as! DeliveryCategoryCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension DeliveryCategoryViewController: UICollectionViewDelegate {
    
}

extension DeliveryCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 343, height: 148)
    }
}
