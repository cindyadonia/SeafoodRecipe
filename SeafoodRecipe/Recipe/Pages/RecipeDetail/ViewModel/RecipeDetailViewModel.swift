//
//  RecipeDetailViewModel.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 26/05/22.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher

enum RecipeDetailComponent: Equatable {
    case imageCell(url: String)
    case headerCell(title: String, subtitle: String)
    case subHeaderCell(title: String)
    case ingridientCell(label: String, value: String)
    case instructionCell(description: String)
}

class RecipeDetailViewModel {
    let useCase: RecipeUseCase
    let mealId: String
    
    init(useCase: RecipeUseCase, mealId: String) {
        self.useCase = useCase
        self.mealId = mealId
    }
    
    struct Input {
        let didLoadTrigger: Driver<Void>
    }
    
    struct Output {
        let recipeDetail: Driver<[RecipeDetailComponent]>
        let error: Driver<String>
    }
    
    func convertToIngredientCell(_ label: String, _ value: String, _ components: inout [RecipeDetailComponent]) {
        if !label.isEmpty, !value.isEmpty {
                components.append(.ingridientCell(label: label, value: value))
            }
        }
    
    func tranform(input: Input) -> Output {
        let recipeDetailResponse = input.didLoadTrigger
            .flatMapLatest { [useCase, mealId] _ -> Driver<Result<RecipeDetailResponse, ApiError>> in
                return useCase.fetchRecipeDetail(mealId: mealId)
                    .asDriver(onErrorDriveWith: .never())
            }
        
        let recipeDetail = recipeDetailResponse
            .compactMap { [weak self] result -> [RecipeDetailComponent]? in
                guard let self = self, case let .success(data) = result, let meal = data.meals.first else { return nil }
               var components: [RecipeDetailComponent] = []

               components.append(.imageCell(url: meal.strMealThumb))
               components.append(.headerCell(title: meal.strMeal, subtitle: meal.strCategory))
               components.append(.subHeaderCell(title: "Ingridients"))
               self.convertToIngredientCell(meal.strIngredient1, meal.strMeasure1, &components)
               self.convertToIngredientCell(meal.strIngredient2, meal.strMeasure2, &components)
               self.convertToIngredientCell(meal.strIngredient3, meal.strMeasure3, &components)
               self.convertToIngredientCell(meal.strIngredient4, meal.strMeasure4, &components)
               self.convertToIngredientCell(meal.strIngredient5, meal.strMeasure5, &components)
               self.convertToIngredientCell(meal.strIngredient6, meal.strMeasure6, &components)
               self.convertToIngredientCell(meal.strIngredient7, meal.strMeasure7, &components)
               self.convertToIngredientCell(meal.strIngredient8, meal.strMeasure8, &components)
               self.convertToIngredientCell(meal.strIngredient9, meal.strMeasure9, &components)
               self.convertToIngredientCell(meal.strIngredient10, meal.strMeasure10, &components)
               self.convertToIngredientCell(meal.strIngredient11, meal.strMeasure11, &components)
               self.convertToIngredientCell(meal.strIngredient12, meal.strMeasure12, &components)
               self.convertToIngredientCell(meal.strIngredient13, meal.strMeasure13, &components)
               self.convertToIngredientCell(meal.strIngredient14, meal.strMeasure14, &components)
               self.convertToIngredientCell(meal.strIngredient15, meal.strMeasure15, &components)
               self.convertToIngredientCell(meal.strIngredient16, meal.strMeasure16, &components)
               self.convertToIngredientCell(meal.strIngredient17, meal.strMeasure17, &components)
               self.convertToIngredientCell(meal.strIngredient18, meal.strMeasure18, &components)
               self.convertToIngredientCell(meal.strIngredient19, meal.strMeasure19, &components)
               self.convertToIngredientCell(meal.strIngredient20, meal.strMeasure20, &components)
               components.append(.subHeaderCell(title: "Instruction"))
               components.append(.instructionCell(description: meal.strInstructions))
               return components
           }
    
        let error = recipeDetailResponse
            .compactMap { result -> String? in
                guard case let .failure(error) = result else { return nil }
                return error.localizedDescription
            }
        
        return Output(
            recipeDetail: recipeDetail,
            error: error
        )
    }
}
