//
//  ApiError.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import Foundation

enum ApiError: Error {
    case unauthorized               // Status code 401
    case forbidden                  // Status code 403
    case notFound                   // Status code 404
    case conflict                   // Status code 409
    case internalServerError    // Status code 500
    case unknown
    case error(ErrorResponse)
    
    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Maaf Anda tidak memiliki izin untuk melakukan proses ini. Silahkan login ulang"
        case .forbidden:
            return "forbidden"
        case .notFound:
            return "notFound"
        case .conflict:
            return "conflict"
        case .internalServerError:
            return "Terjadi kesalahan pada server"
        case .unknown:
            return "Maaf terjadi kesalahan yang tidak diketahui"
        case let .error(response):
            return response.message
        }
    }
}

struct ErrorResponse: Decodable {
    let errorCode: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case errorCode, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorCode = (try? values.decodeIfPresent(String.self, forKey: .errorCode)) ?? ""
        message = (try? values.decodeIfPresent(String.self, forKey: .message)) ?? ""
    }
    
    init(){
        errorCode = ""
        message = ""
    }
}
