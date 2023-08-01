//
//  CardViewModel.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

class CardViewModel: ObservableObject {
    let serviceHandler: CardServiceDelegate
    
    init(serviceHandler: CardServiceDelegate = CardService()) {
        self.serviceHandler = serviceHandler
    }
    
    @Published var cards = [Card]()
    
    func fetchCards() {
            serviceHandler.getCards { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let cards):
                        self.cards = cards
                        print(self.cards)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
}
