//
//  RecipeViewModel.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation
import RxSwift
import RxCocoa

// Tempat business logic -> manipulate jg di sini
class RecipeViewModel {
    let useCase: RecipeUseCase // dependency injection
    
    init(useCase: RecipeUseCase) {
        self.useCase = useCase
    }
    
    struct Input {
        let didLoadTrigger: Driver<Void>
    }
    
    struct Output {
        let recipes: Driver<[RecipeList]>
        let error: Driver<String>
    }
    
    func tranform(input: Input) -> Output {
        let recipeResponse = input.didLoadTrigger
            .flatMapLatest { [useCase] _ -> Driver<Result<RecipeListResponse, ApiError>> in
                return useCase.fetchRecipes()
                    .asDriver(onErrorDriveWith: .never())
            }
        
        let recipes = recipeResponse
            .compactMap { result -> [RecipeList]? in
                guard case let .success(data) = result else { return nil }
                return data.meals
            }
        
        let error = recipeResponse
            .compactMap { result -> String? in
                guard case let .failure(error) = result else { return nil }
                return error.localizedDescription
            }
        
        return Output(
            recipes: recipes,
            error: error
        )
    }
}
