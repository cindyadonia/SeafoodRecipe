//
//  RecipeUseCase.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation
import Alamofire
import RxSwift

// Use Case is used to hit API Endpoint
class RecipeUseCase {
    let apiClient = ApiClient.shared
    
    func fetchRecipes() -> Observable<Result<RecipeListResponse, ApiError>>{
        return apiClient.request(RecipeTarget.recipes(mealCategory: "Seafood"))
    }
    
    func fetchRecipeDetail(mealId: String) -> Observable<Result<RecipeDetailResponse, ApiError>>{
        return apiClient.request(RecipeTarget.recipeDetail(mealId: mealId))
    }
}
