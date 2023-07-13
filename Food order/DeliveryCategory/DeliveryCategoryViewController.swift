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
    @IBOutlet weak var indicatorActivity: UIActivityIndicatorView!
    
    var titleCategory: String = ""
    
    private var viewModel: DeliveryCategoryViewModelProtocol! {
        didSet {
            indicatorActivity.startAnimating()
            viewModel.fetchCategoru {
                DispatchQueue.main.async {
                    self.collectiovViewCategory.reloadData()
                    self.indicatorActivity.stopAnimating()
                    self.indicatorActivity.isHidden = true
                }
            }
        }
    }
    
    private var corDate: CorrectDateProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DeliveryCategoryViewModel()
        corDate = CorrectDateModel()
        collectiovViewCategory.layer.cornerRadius = 10
        сorrectData.text = corDate.сorDate()
        navigationItem.backButtonTitle = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "choiceOfDish" {
            let menuCategoru = segue.destination as! ChoiceOfDishViewController
            menuCategoru.titleCategory = titleCategory
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = viewModel.cellViewModel(at: indexPath)
        titleCategory = title.name
        performSegue(withIdentifier: "choiceOfDish", sender: self)
    }
}
