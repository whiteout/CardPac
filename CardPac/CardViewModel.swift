//
//  CardViewModel.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation
import SwiftUI

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
    
    // Function to modify the section header text using enum cases
    func modifiedSectionHeaderText(for key: String) -> Text {
        // Convert the key to the CreditCardType enum
        if let cardType = CreditCardType(rawValue: key) {
            // Use switch-case on the enum cases
            switch cardType {
            case .americanExpress:
                return Text(Constants.CREDIT_CARD_TYPES.AMERICAN_EXPRESS)
            case .dankort:
                return Text(Constants.CREDIT_CARD_TYPES.DANKORT)
            case.dinersClub:
                return Text(Constants.CREDIT_CARD_TYPES.DINERS_CLUB)
            case .masterCard:
                return Text(Constants.CREDIT_CARD_TYPES.MASTER_CARD)
            case .discover:
                return Text(Constants.CREDIT_CARD_TYPES.DISCOVER)
            case .forbrugsforeningen:
                return Text(Constants.CREDIT_CARD_TYPES.FORBRUGSFORENINGEN)
            case .jcb:
                return Text(Constants.CREDIT_CARD_TYPES.JCB)
            case .laser:
                return Text(Constants.CREDIT_CARD_TYPES.LASER)
            case .maestro:
                return Text(Constants.CREDIT_CARD_TYPES.MAESTRO)
            case .solo:
                return Text(Constants.CREDIT_CARD_TYPES.SOLO)
            case .switchCard:
                return Text(Constants.CREDIT_CARD_TYPES.SWITCH)
            case .visa:
                return Text(Constants.CREDIT_CARD_TYPES.VISA)
            }
        }
        
        return Text(Constants.COMMON_STRINGS.EMPTY_STRING)
    }
    
    // Function to sort the cards based on credit_card_type and group them
    func groupedSortedCards() -> [String: [Card]] {
        let sortedCards = self.sortedCards()
        return Dictionary(grouping: sortedCards, by: { $0.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING })
    }
    
    // Function to sort the cards based on credit_card_type
    func sortedCards() -> [Card] {
        return self.cards.sorted(by: { $0.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING < $1.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING })
    }
}
