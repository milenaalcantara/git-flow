//
//  CategoriesDetailCollection.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import UIKit

class CategoriesDetailCollection: NSObject, UICollectionViewDataSource {
    var categories: [Category]
    
    init(categories: [Category]) {
        self.categories = categories
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( // swiftlint:disable force_cast
            withReuseIdentifier: "categoryCellDetail",
            for: indexPath
        ) as! CategoryCellDetail
        
        cell.name.text = categories[indexPath.item].name
        cell.nameImage.image = UIImage(named: categories[indexPath.item].nameImage)
        cell.blackOpacity.backgroundColor = .black
        cell.blackOpacity.alpha = 0.3
        
        return cell
    }
}
