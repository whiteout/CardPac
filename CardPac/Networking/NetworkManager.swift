//
//  NetworkManager.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

enum NetworkError: Error { //TODO: add String
    case badUrl(message: String)
    case noData(message: String)
    case decodingError(message: String)
    
    var errorMessage: String {
            switch self {
            case .badUrl(let message):
                return message
            case .noData(let message):
                return message
            case .decodingError(let message):
                return message
            
        }
    }
}


class NetworkManager {
    let aPIHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(aPIHandler: APIHandlerDelegate = APIHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
       
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    
}


