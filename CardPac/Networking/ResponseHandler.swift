//
//  ResponseHandler.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, NetworkError>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, NetworkError>) -> Void) {
        let response = try? JSONDecoder().decode(type.self, from: data)
        if let response = response {
            return completion(.success(response))
        } else {
            completion(.failure(.DecodingError))
        }
    }
    
}
