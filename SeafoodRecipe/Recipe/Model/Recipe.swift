//
//  Recipe.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation

struct RecipeListResponse: Codable {
    let meals: [RecipeList]
}

struct RecipeList: Codable, Equatable {
    let recipeName: String
    let recipeImageUrl: String
    let recipeId: String
    
    private enum CodingKeys: String, CodingKey {
        case recipeName = "strMeal"
        case recipeImageUrl = "strMealThumb"
        case recipeId = "idMeal"
    }
}

struct RecipeDetailResponse: Codable {
    let meals: [RecipeDetail]
}

struct RecipeDetail: Codable, Equatable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    
    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strCategory, strInstructions, strMealThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = (try? values.decodeIfPresent(String.self, forKey: .idMeal)) ?? ""
        strMeal = (try? values.decodeIfPresent(String.self, forKey: .strMeal)) ?? ""
        strCategory = (try? values.decodeIfPresent(String.self, forKey: .strCategory)) ?? ""
        strInstructions = (try? values.decodeIfPresent(String.self, forKey: .strInstructions)) ?? ""
        strMealThumb = (try? values.decodeIfPresent(String.self, forKey: .strMealThumb)) ?? ""
        strIngredient1 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient1)) ?? ""
        strIngredient2 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient2)) ?? ""
        strIngredient3 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient3)) ?? ""
        strIngredient4 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient4)) ?? ""
        strIngredient5 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient5)) ?? ""
        strIngredient6 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient6)) ?? ""
        strIngredient7 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient7)) ?? ""
        strIngredient8 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient8)) ?? ""
        strIngredient9 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient9)) ?? ""
        strIngredient10 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient10)) ?? ""
        strIngredient11 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient11)) ?? ""
        strIngredient12 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient12)) ?? ""
        strIngredient13 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient13)) ?? ""
        strIngredient14 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient14)) ?? ""
        strIngredient15 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient15)) ?? ""
        strIngredient16 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient16)) ?? ""
        strIngredient17 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient17)) ?? ""
        strIngredient18 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient18)) ?? ""
        strIngredient19 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient19)) ?? ""
        strIngredient20 = (try? values.decodeIfPresent(String.self, forKey: .strIngredient20)) ?? ""
        strMeasure1 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure1)) ?? ""
        strMeasure2 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure2)) ?? ""
        strMeasure3 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure3)) ?? ""
        strMeasure4 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure4)) ?? ""
        strMeasure5 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure5)) ?? ""
        strMeasure6 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure6)) ?? ""
        strMeasure7 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure7)) ?? ""
        strMeasure8 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure8)) ?? ""
        strMeasure9 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure9)) ?? ""
        strMeasure10 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure10)) ?? ""
        strMeasure11 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure11)) ?? ""
        strMeasure12 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure12)) ?? ""
        strMeasure13 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure13)) ?? ""
        strMeasure14 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure14)) ?? ""
        strMeasure15 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure15)) ?? ""
        strMeasure16 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure16)) ?? ""
        strMeasure17 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure17)) ?? ""
        strMeasure18 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure18)) ?? ""
        strMeasure19 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure19)) ?? ""
        strMeasure20 = (try? values.decodeIfPresent(String.self, forKey: .strMeasure20)) ?? ""
    }
}
