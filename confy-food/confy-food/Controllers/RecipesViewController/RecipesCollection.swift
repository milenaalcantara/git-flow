//
//  RecipesCollection.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 22/06/22.
//

import UIKit

class RecipesCollection: NSObject, UICollectionViewDataSource {
    var recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "recipeCell",
            for: indexPath
        ) as! RecipeCell // swiftlint:disable:this force_cast
        
        cell.name.text = recipes[indexPath.item].name
        cell.imageName.image = UIImage(named: recipes[indexPath.item].nameImage)
        
        return cell
    }
}
