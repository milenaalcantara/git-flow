//
//  Category.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
// swiftlint:disable trailing_whitespace

import Foundation

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
            Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
            Category(name: "Frutos do Mar 2", nameImage: "frutos-do-mar"),
            Category(name: "Frutos do Mar 3", nameImage: "frutos-do-mar")
        ]
    )
    
    static let categoriesDetailDataSource = [
        Category(name: "Favoritos", nameImage: "favoritos"),
        Category(name: "Frutos do Mar", nameImage: "frutos-do-mar"),
        Category(name: "Frutos do Mar 2", nameImage: "frutos-do-mar"),
        Category(name: "Frutos do Mar 3", nameImage: "frutos-do-mar")
    ]
}
