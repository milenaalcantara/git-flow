//
//  Category.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import Foundation
import UIKit

class Category: NSObject {
    var name: String
    var nameImage: String
    
    init(name: String, nameImage: String) {
        self.name = name
        self.nameImage = nameImage
    }
}

extension Category {

    static let categoriesDataSource = CategoriesCollection(
        categories: [
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar")
        ]
    )
    
    static let categoriesDetailDataSource = CategoriesDetailCollection(
        categories: [
            Category(name: "Favoritos", nameImage: "favoritos"),
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar")
        ]
    )
}
