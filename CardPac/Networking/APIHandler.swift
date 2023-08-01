//
//  APIHandler.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

protocol APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void)
}

class APIHandler: APIHandlerDelegate {
    func fetchData(url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            completion(.success(data))
           
        }.resume()
    }
    
}
