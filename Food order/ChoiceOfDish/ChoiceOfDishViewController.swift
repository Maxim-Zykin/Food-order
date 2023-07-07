//
//  ChoiceOfDishViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import UIKit

class ChoiceOfDishViewController: UIViewController {

    @IBOutlet weak var dishCollection: UICollectionView!
    @IBOutlet weak var tegsSegmented: UISegmentedControl!
    
    private var viewModel: ChoiceOfDishViewModelProtocol! {
        didSet {
            viewModel.fetchDish {
                DispatchQueue.main.async {
                    self.dishCollection.reloadData()
                }
            }
        }
    }
    
    var titleCategory: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ChoiceOfDishViewModel()
        navigationItem.backButtonTitle = ""
        //navigationItem.title = titleCategory
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuCategoru = segue.destination as! DetailDishViewController
        menuCategoru.viewModel = sender as? DetailDishViewModelProtocol
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

extension ChoiceOfDishViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let info = viewModel.viewModelForSelectedRow(at: indexPath)
        performSegue(withIdentifier: "detainDish", sender: info)
        print("\(info.dishName)")
        print("\(info.dishDescription)")
    }
}
