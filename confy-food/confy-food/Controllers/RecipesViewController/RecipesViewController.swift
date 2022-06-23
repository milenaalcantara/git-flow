//
//  RecipesViewController.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class RecipesViewController: UIViewController {
    var recipesList = [Recipe]()
    
    var searchedRecipes = [Recipe]()
    var searching = false

    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet var recipesCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipesCollection.delegate = self
        recipesCollection.dataSource = self
        recipesCollection.backgroundColor = .clear
        
        // MARK: - Navbar Appearence
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
        for recipe in Recipe.recipesDataSource {
            recipesList.append(recipe)
        }
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
    
extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if searching {
            return searchedRecipes.count
        } else {
            return recipesList.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        // swiftlint:disable force_cast
        let cell = recipesCollection.dequeueReusableCell(
            withReuseIdentifier: "recipeCell",
            for: indexPath
        ) as! RecipeCell
        // swiftlint:enable force_cast
        
        if searching {
            cell.imageName.image = UIImage(named: searchedRecipes[indexPath.row].nameImage)
            cell.name.text = searchedRecipes[indexPath.row].name
        } else {
            cell.imageName.image = UIImage(named: recipesList[indexPath.row].nameImage)
            cell.name.text = recipesList[indexPath.row].name
        }
        return cell
    }
}

extension RecipesViewController: UISearchResultsUpdating, UISearchBarDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        if (!searchText.isEmpty) {
            searching = true
            searchedRecipes.removeAll()
            for recipe in recipesList {
                if recipe.name.lowercased().contains(searchText.lowercased()) {
                    searchedRecipes.append(recipe)
                }
            }
        } else {
            searching = false
            searchedRecipes.removeAll()
            searchedRecipes = recipesList
        }

        recipesCollection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedRecipes.removeAll()
        recipesCollection.reloadData()
    }
}
