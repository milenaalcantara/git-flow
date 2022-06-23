//
//  CategoriesViewController.swift
//  confy-food
//
//  Created by Joan Wilson Oliveira on 15/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class CategoriesViewController: UIViewController {
    var categoriesList = [Category]()
    
    var searchedCategories = [Category]()
    var searching = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var categoriesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollection.delegate = self
        categoriesCollection.dataSource = self
        categoriesCollection.backgroundColor = .clear
        
        // MARK: - Navbar Appearence
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        
        // MARK: - CategoriesCollectionView DataSource
//        categoriesCollection.dataSource = Category.categoriesDetailDataSource
        fillData()
        configureSearchController()
    }
    
    // MARK: - SearchBar
    func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Procurar Receita"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func fillData() {
        for category in Category.categoriesDetailDataSource {
            categoriesList.append(category)
        }
    }
}

extension CategoriesViewController: UICollectionViewDelegate,
    UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching {
            return searchedCategories.count
        } else {
            return categoriesList.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        // swiftlint:disable force_cast
        let cell = categoriesCollection.dequeueReusableCell(
            withReuseIdentifier: "categoryCellDetail",
            for: indexPath
        ) as! CategoryCellDetail
        // swiftlint:enable force_cast
        
        if searching {
            cell.nameImage.image = UIImage(named: searchedCategories[indexPath.row].nameImage)
            cell.name.text = searchedCategories[indexPath.row].name
        } else {
            cell.nameImage.image = UIImage(named: categoriesList[indexPath.row].nameImage)
            cell.name.text = categoriesList[indexPath.row].name
        }
        return cell
    }
}

// MARK: - SearchBar Results
extension CategoriesViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
  func updateSearchResults(for searchController: UISearchController) {
      
      guard let searchText = searchController.searchBar.text else { return }
      
      if (!searchText.isEmpty) {
          searching = true
          searchedCategories.removeAll()
          for recipe in categoriesList {
              if recipe.name.lowercased().contains(searchText.lowercased()) {
                  searchedCategories.append(recipe)
              }
          }
      } else {
          searching = false
          searchedCategories.removeAll()
          searchedCategories = categoriesList
      }

      categoriesCollection.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searching = false
      searchedCategories.removeAll()
      categoriesCollection.reloadData()
  }
}
