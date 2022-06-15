//
//  ViewController.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 03/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recentRecipeList: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    let categoriesDataSource = CategoriasDataSource(
        categories: [
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar")
        ]
    )
    var newRecipes: [Recipe] = [
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        recentRecipeList.dataSource = self
        recentRecipeList.backgroundColor = .clear
        categoriesCollectionView.dataSource = categoriesDataSource
        categoriesCollectionView.backgroundColor = .clear
    }
}

// MARK: - Minhas Receitas

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newRecipes.count
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: "recipeCell",
                for: indexPath
            ) as! RecentRecipeCell // swiftlint:disable:this force_cast

        cell.labelRecipe.text = newRecipes[indexPath.item].name
        cell.imageRecipe.image = UIImage(
            named: newRecipes[indexPath.item].nameImage
        )

        return cell
    }
}

class Recipe: NSObject {
    var name: String
    var nameImage: String
    init(name: String, nameImage: String) {
        self.name = name
        self.nameImage = nameImage
    }
}

class RecentRecipeCell: UICollectionViewCell {

    @IBOutlet var labelRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
}

// MARK: - Categorias

class CategoriasDataSource: NSObject, UICollectionViewDataSource {
    var categories: [Category]
    init(categories: [Category]) {
        self.categories = categories
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //swiftlint:disable:this line_length

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCell // swiftlint:disable:this force_cast

        cell.name.text = categories[indexPath.item].name
        cell.nameImage.image = UIImage(named: categories[indexPath.item].nameImage)
        cell.blackOpacity.backgroundColor = .black
        cell.blackOpacity.alpha = 0.3
        return cell
    }
}

class Category: NSObject {
    var name: String
    var nameImage: String
    init(name: String, nameImage: String) {
        self.name = name
        self.nameImage = nameImage
    }
}

class CategoriesCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameImage: UIImageView!
    @IBOutlet weak var blackOpacity: UILabel!
}
