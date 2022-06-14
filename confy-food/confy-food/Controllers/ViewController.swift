//
//  ViewController.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 03/06/22.
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD
    override func viewDidLoad() {
        super.viewDidLoad()
=======
    @IBOutlet weak var recentRecipeList: UICollectionView!
    var newRecipes: [Recipe] = [
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
        Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
        Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "splash-background")
        navBarAppearance.titlePositionAdjustment = .init(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.compactAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        recentRecipeList.dataSource = self
        
        recentRecipeList.backgroundColor = .clear
        

    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newRecipes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recentRecipeList.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecentRecipeCell // swiftlint:disable:this force_cast


        cell.labelRecipe.text = newRecipes[indexPath.item].name
        cell.imageRecipe.image = UIImage(named: newRecipes[indexPath.item].nameImage)
        
        //        cell.label.text = itemsDataSource?[indexPath.item].name
        return cell
>>>>>>> a2434a0 (create main view and populate the collection view datasource)
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
