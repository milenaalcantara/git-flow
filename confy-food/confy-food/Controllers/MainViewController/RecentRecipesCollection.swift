//
//  RecentRecipesCollection.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class RecentRecipesCollection: NSObject, UICollectionViewDataSource {
    var recentRecipes: [Recipe]
    
    init(recentRecipes: [Recipe]) {
        self.recentRecipes = recentRecipes
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recentRecipes.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: "recentRecipeCell",
                for: indexPath
            ) as! RecentRecipeCell // swiftlint:disable:this force_cast

        cell.labelRecipe.text = recentRecipes[indexPath.item].name
        cell.imageRecipe.image = UIImage(
            named: recentRecipes[indexPath.item].nameImage
        )

        return cell
    }
}
