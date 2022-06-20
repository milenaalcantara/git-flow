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
    
    let categoriesDataSource: [Category] = [
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
        ]
    

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
        categoriesCollection.dataSource = self

    }
}

// MARK: - SearchBar Results
extension CategoriesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}

// MARK: - CategoriesCollectionView DataSource
extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesDataSource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( // swiftlint:disable force_cast
            withReuseIdentifier: "categoryCellDetail",
            for: indexPath
        ) as! CategoryCellDetail
        
        cell.name.text = categoriesDataSource[indexPath.item].name
        cell.nameImage.image = UIImage(named: categoriesDataSource[indexPath.item].nameImage)
        cell.blackOpacity.backgroundColor = .black
        cell.blackOpacity.alpha = 0.3
        
        return cell
    }
}

class CategoryCellDetail: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameImage: UIImageView!
    @IBOutlet weak var blackOpacity: UILabel!
}
