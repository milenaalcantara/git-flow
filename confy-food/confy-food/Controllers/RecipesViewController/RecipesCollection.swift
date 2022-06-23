////
////  RecipesCollection.swift
////  confy-food
////
////  Created by Milena Lima de Alcântara on 22/06/22.
//// swiftlint:disable trailing_whitespace
//
//import UIKit
//
//class RecipesCollection: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    var recipes: [Recipe]
//    
//    var searchedRecipes = [Recipe]()
//    var searching = false
//    
//    init(recipes: [Recipe]) {
//        self.recipes = recipes
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if searching {
//            return searchedRecipes.count
//        } else {
//            return recipes.count
//        }
//    }
//    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        cellForItemAt indexPath: IndexPath
//    ) -> UICollectionViewCell {
//       
//        let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: "recipeCell",
//            for: indexPath
//        ) as! RecipeCell // swiftlint:disable:this force_cast
//        
//        if searching {
//            cell.name.text = searchedRecipes[indexPath.row].name // .item
//            cell.imageName.image = UIImage(named: searchedRecipes[indexPath.row].nameImage) // .item
//        } else {
//            cell.name.text = recipes[indexPath.row].name // .item
//            cell.imageName.image = UIImage(named: recipes[indexPath.row].nameImage) // .item
//        }
//        return cell
//    }
//}
//
////
////class RecipesCollection: NSObject, UICollectionViewDataSource {
////    var recipes: [Recipe]
////
////    init(recipes: [Recipe]) {
////        self.recipes = recipes
////    }
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 3
////    }
////
////    func collectionView(
////        _ collectionView: UICollectionView,
////        cellForItemAt indexPath: IndexPath
////    ) -> UICollectionViewCell {
////
////        let cell = collectionView.dequeueReusableCell(
////            withReuseIdentifier: "recipeCell",
////            for: indexPath
////        ) as! RecipeCell // swiftlint:disable:this force_cast
////        cell.name.text = recipes[indexPath.item].name
////        cell.imageName.image = UIImage(named: recipes[indexPath.item].nameImage)
////
////        return cell
////    }
////}
