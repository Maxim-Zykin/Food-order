//
//  DeliveryCategoryViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import UIKit

class DeliveryCategoryViewController: UIViewController {

    @IBOutlet weak var collectiovViewCategory: UICollectionView!
    @IBOutlet weak var сorrectData: UILabel!
    
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
        collectiovViewCategory.layer.cornerRadius = 10
        сorrectData.text = viewModel.сorData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuCategoru = segue.destination as! ChoiceOfDishViewController
        menuCategoru.titleCategory = ""
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

//extension DeliveryCategoryViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        let choiceOfDish = viewModel
//    }
//}
