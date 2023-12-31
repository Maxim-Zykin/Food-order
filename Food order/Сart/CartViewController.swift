//
//  CartViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 12.07.2023.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tabelViewDish: UITableView!
    @IBOutlet weak var сorrectData: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var checkoutButton: UIButton!
    
    private var viewModel: CartViewModelProtocol!
    private var corDate: CorrectDateProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewDish.dataSource = self
        tabelViewDish.delegate = self
        viewModel = CartViewModel()
        corDate = CorrectDateModel()
        tabelViewDish.rowHeight = 85
        сorrectData.text = corDate.сorDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabelViewDish.reloadData()
        emptyCartButton()
    }
    
    private func emptyCartButton() {
        if dishCart.isEmpty {
            checkoutButton.isHidden = true
        } else {
            checkoutButton.isHidden = false
        }
    }
    
    @IBAction func checkoutButton(_ sender: Any) {
        AlertManager.alertСheckout(on: self)
        viewModel.checkout()
        DispatchQueue.main.async {
            self.tabelViewDish.reloadData()
        }
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
