//
//  ChoiceOfDishViewController.swift
//  Food order
//
//  Created by Максим Зыкин on 03.07.2023.
//

import UIKit

class ChoiceOfDishViewController: UIViewController {

    var titleCategory: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleCategory
    }
}
