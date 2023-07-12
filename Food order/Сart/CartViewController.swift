//
//  CartViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 12.07.2023.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tabelViewDish: UITableView!
    @IBOutlet weak var сorrectData: UILabel!
    @IBOutlet weak var payButton: UIButton!
    
    
    private var viewModel: CartViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CartViewModel()
        tabelViewDish.rowHeight = 85
        сorrectData.text = viewModel.сorData()
    }

}

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)

        return cell
    }
}
