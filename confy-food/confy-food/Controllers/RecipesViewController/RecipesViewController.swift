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

class RecipesCollection: NSObject, UICollectionViewDataSource {
    var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCell // swiftlint:disable:this force_cast
        cell.name.text = recipes[indexPath.item].name
        cell.imageName.image = UIImage(named: recipes[indexPath.item].nameImage)
        
        return cell
    }
}


class RecipeCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageName: UIImageView!
}
