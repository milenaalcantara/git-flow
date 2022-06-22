//
//  RecipesViewController.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet var recipesCollection: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Navbar Appearence
        recipesCollection.backgroundColor = .clear
        recipesCollection.dataSource = Recipe.recipesDataSource
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        
        // MARK: - Navbar Items
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(self.addTapped)
        )

        // MARK: - SearchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Procurar categoria"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    @objc func addTapped() {
        let addRecipeStoryboard = UIStoryboard(name: "AddRecipeView", bundle: .main)
        guard let addRecipeViewController = addRecipeStoryboard.instantiateViewController(
            withIdentifier: "addrecipe"
        ) as? AddRecipeViewController else {
            return
        }

        addRecipeViewController.title = "Adicionar receita"
        
        let nav = UINavigationController(rootViewController: addRecipeViewController)
        self.present(nav, animated: true)
        
    }

}

// MARK: - SearchBar Results
extension RecipesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
  }
}
