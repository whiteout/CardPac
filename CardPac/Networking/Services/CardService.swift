//
//  CardService.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

protocol CardServiceDelegate: CardDelegate {
    
}

protocol CardDelegate {
    func getCards(completion: @escaping(Result<[Card], NetworkError>) -> Void)
}

class CardService: CardServiceDelegate  {
    
    func getCards(completion: @escaping(Result<[Card], NetworkError>) -> Void) {
        
        guard let url = URL(string: Constants.Urls.BaseUrl) else {
            return completion(.failure(.badUrl(message: Constants.NetworkErrorMessages.BadUrl)))
        }
        
        NetworkManager().fetchRequest(type: [Card].self, url: url, completion: completion)
    }

}
