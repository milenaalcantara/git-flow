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
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
//        navigationItem.backBarButtonItem?.tintColor = .gray  // descobrir como mudar a cor depois
        
        
        // MARK: - SearchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Procurar categoria"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }

}

// MARK: - SearchBar Results
extension RecipesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}
