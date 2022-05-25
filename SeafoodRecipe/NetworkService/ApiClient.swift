//
//  ApiClient.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation
import Alamofire
import RxSwift

class ApiClient {
    static let shared = ApiClient()
    
    func request<T: Decodable> (_ urlConvertible: URLRequestConvertible) -> Observable<Result<T, ApiError>> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<Result<T, ApiError>>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible)
                .validate()
                .responseDecodable { (response: DataResponse<T, AFError>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                switch response.result {
                case let .success(value):
                    observer.onNext(.success(value))
                    observer.onCompleted()
                case .failure:
                    //Something went wrong, switch on the status code and return the error
                    switch response.response?.statusCode {
                    case 401:
                        observer.onNext(.failure(ApiError.unauthorized))
                    case 403:
                        observer.onNext(.failure(ApiError.forbidden))
                    case 404:
                        observer.onNext(.failure(ApiError.notFound))
                    case 409:
                        observer.onNext(.failure(ApiError.conflict))
                    case 500:
                        observer.onNext(.failure(ApiError.internalServerError))
                    default:
                        observer.onNext(.failure(ApiError.notFound))
                    }
                    observer.onCompleted()
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
