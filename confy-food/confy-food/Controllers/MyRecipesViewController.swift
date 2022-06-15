//
//  MyRecipesViewController.swift
//  confy-food
//
//  Created by Joan Wilson Oliveira on 14/06/22.
//

import UIKit

class MyRecipesViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Wilson"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        activateContrains()
     
    }
    // MARK:
    func activateContrains() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
        ])
    }
}
