//
//  Recipe.swift
//  confy-food
//
//  Created by Milena Lima de Alcântara on 21/06/22.
//

import Foundation

class Recipe: NSObject {
    var name: String
    var nameImage: String
    init(name: String, nameImage: String) {
        self.name = name
        self.nameImage = nameImage
    }
}

extension Recipe {
    static let recentRecipesDataSource = RecentRecipesCollection(
        recentRecipes: [
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate")
        ]
    )
    static let recipesDataSource = RecipesCollection(
        recipes: [
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate"),
            Recipe(name: "Bolo de cenoura", nameImage: "bolo-cenoura"),
            Recipe(name: "Bolo de chocolate", nameImage: "bolo-chocolate")
        ]
    )
}
