//
//  ViewController.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 03/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var recentRecipeList: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        recentRecipeList.dataSource = Recipe.recipesDataSource
        recentRecipeList.backgroundColor = .clear
        categoriesCollectionView.dataSource = Category.categoriesDataSource
        categoriesCollectionView.backgroundColor = .clear
    }
}
