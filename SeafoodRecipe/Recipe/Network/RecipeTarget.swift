//
//  RecipeTarget.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 26/05/22.
//

import Foundation
import Alamofire

enum RecipeTarget: URLRequestConvertible {
    case recipes(mealCategory:String)
    case recipeDetail(mealId:String)
    
    //MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .recipes:
            return "filter.php"
        case .recipeDetail:
            return "lookup.php"
        }
    }
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case let .recipes(mealCategory):
            return [
                "c": mealCategory
            ]
        case let .recipeDetail(mealId):
            return [
                "i": mealId
            ]
        }
    }
    
    // MARK: - Header
    private var header: [String: String] {
        switch self {
        default:
            return [:]
        }
    }
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try "https://www.themealdb.com/api/json/v1/1/".asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.timeoutInterval = 10
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Http header
        for h in header {
            urlRequest.setValue(h.value, forHTTPHeaderField: h.key)
        }
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
