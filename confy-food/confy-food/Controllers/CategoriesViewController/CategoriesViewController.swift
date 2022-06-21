//
//  CategoriesViewController.swift
//  confy-food
//
//  Created by Joan Wilson Oliveira on 15/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollection: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Navbar Appearence
        categoriesCollection.backgroundColor = .clear
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        
        // MARK: - SearchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // MARK: - CategoriesCollectionView DataSource
        categoriesCollection.dataSource = Category.categoriesDetailDataSource

    }
}

// MARK: - SearchBar Results
extension CategoriesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}
