//
//  MyRecipesViewController.swift
//  confy-food
//
//  Created by Joan Wilson Oliveira on 14/06/22.
//

import UIKit

class MyRecipesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        activateContrains()
    }
}
