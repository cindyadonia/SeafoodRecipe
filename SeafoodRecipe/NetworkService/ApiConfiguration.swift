//
//  ApiConfiguration.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation
import Alamofire

protocol ApiConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
