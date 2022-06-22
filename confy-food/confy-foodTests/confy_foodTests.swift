//
//  confy_foodTests.swift
//  confy-foodTests
//
//  Created by Milena Lima de Alcântara on 03/06/22.
//  swiftlint:disable trailing_whitespace

import XCTest
@testable import confy_food

class ConfyFoodTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_IfTheRecentRecipesCollectionDataSourceIsPopulated()  throws {
        Recipe.recentRecipesDataSource.recentRecipes.append(Recipe(name: "test", nameImage: "test"))
        XCTAssertEqual(Recipe.recentRecipesDataSource.recentRecipes.last?.name, "test")
        Recipe.recentRecipesDataSource.recentRecipes.removeLast()
    }

    func test_IfTheRecentRecipesCollectionDataSourceCanDropAnObject() throws {
        Recipe.recentRecipesDataSource.recentRecipes.append(Recipe(name: "testDelete", nameImage: "testDelete"))
        Recipe.recentRecipesDataSource.recentRecipes.removeLast()
        XCTAssertNotEqual(Recipe.recentRecipesDataSource.recentRecipes.last?.name, "testDelete")
    }

    func test_IfTheRecipeCollectionDataSourceIsPopulated() throws {
        Recipe.recipesDataSource.recipes.append(Recipe(name: "testRecipe", nameImage: "testRecipe"))
        XCTAssertEqual(Recipe.recipesDataSource.recipes.last?.name, "testRecipe")
        Recipe.recipesDataSource.recipes.removeLast()
    }

    func test_IfTheCategoriesCollectionDataSourceIsPopulated() throws {
        let test =  Category(name: "test", nameImage: "test")
        Category.categoriesDataSource.categories.append(test)
        XCTAssertEqual(Category.categoriesDataSource.categories.last?.name, "test")
        Category.categoriesDataSource.categories.removeLast()
    }
    
    func test_IfTheCategoriesCollectionDataSourceCanDropAnObject() throws {
        let test = Category(name: "test", nameImage: "test")
        Category.categoriesDataSource.categories.append(test)
        Category.categoriesDataSource.categories.removeLast()
        XCTAssertNotEqual(Category.categoriesDataSource.categories.last?.name, "test")
    }
    
    func test_IfTheCategoriesCollectionDetailDataSourceIsPopulated() throws {
        let test =  Category(name: "test", nameImage: "test")
        Category.categoriesDetailDataSource.categories.append(test)
        XCTAssertEqual(Category.categoriesDetailDataSource.categories.last?.name, "test")
        Category.categoriesDetailDataSource.categories.removeLast()
    }
    
    func test_IfTheCategoriesCollectionDetailDataSourceCanDropAnObject() throws {
        let test = Category(name: "test", nameImage: "test")
        Category.categoriesDetailDataSource.categories.append(test)
        Category.categoriesDetailDataSource.categories.removeLast()
        XCTAssertNotEqual(Category.categoriesDetailDataSource.categories.last?.name, "test")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
