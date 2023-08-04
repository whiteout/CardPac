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
    @Published var isShowBookmarkedCards = false
    
    init(serviceHandler: CardServiceDelegate = CardService()) {
        self.serviceHandler = serviceHandler
    }
    
    @Published var cards = [Card]()
    @Published var bookmarkedCards: [Card] = []
    
    func fetchCards() {
            serviceHandler.getCards { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let cards):
                        self.cards = cards
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
    
    // Function to handle saving the selected card. If card is already in array remove it, else add it.
      func saveBookmarkedCard(card: Card) {
          
          if let index = bookmarkedCards.firstIndex(where: { $0.id == card.id }) {
              // Card is already in the array, remove it
              bookmarkedCards.remove(at: index)
          } else {
              // Card is not in the array, add it
              bookmarkedCards.append(card)
          }
          
      }
    
    // Function to rename the section header text using enum cases
    func modifiedSectionHeaderText(for key: String) -> Text {

        if let cardType = CreditCardType(rawValue: key) {
            // Use switch-case on the enum cases
            switch cardType {
            case .americanExpress:
                return Text(Constants.CreditCardTypes.AmericanExpress)
            case .dankort:
                return Text(Constants.CreditCardTypes.Dankort)
            case.dinersClub:
                return Text(Constants.CreditCardTypes.DinersClub)
            case .masterCard:
                return Text(Constants.CreditCardTypes.MasterCard)
            case .discover:
                return Text(Constants.CreditCardTypes.Discover)
            case .forbrugsforeningen:
                return Text(Constants.CreditCardTypes.Forbrugsforeningen)
            case .jcb:
                return Text(Constants.CreditCardTypes.Jcb)
            case .laser:
                return Text(Constants.CreditCardTypes.Laser)
            case .maestro:
                return Text(Constants.CreditCardTypes.Maestro)
            case .solo:
                return Text(Constants.CreditCardTypes.Solo)
            case .switchCard:
                return Text(Constants.CreditCardTypes.Switch)
            case .visa:
                return Text(Constants.CreditCardTypes.Visa)
            }
        }
        return Text(Constants.CommonStrings.EmptyString)
    }
    
    // Function to sort the cards based on credit_card_type and group them
    func groupedSortedCards() -> [String: [Card]] {
        let sortedCards = self.sortedCards()
        return Dictionary(grouping: sortedCards, by: { $0.creditCardType ?? Constants.CommonStrings.EmptyString })
    }
    
    
    func showBookmarkedCards() {
        isShowBookmarkedCards.toggle()
    }
    
    // Function to sort the cards based on credit_card_type
    func sortedCards() -> [Card] {
        
        if(isShowBookmarkedCards) {
            // To only show the bookmarked cards
            return self.bookmarkedCards.sorted(by: { $0.creditCardType ?? Constants.CommonStrings.EmptyString < $1.creditCardType ?? Constants.CommonStrings.EmptyString })
        }
        
        return self.cards.sorted(by: { $0.creditCardType ?? Constants.CommonStrings.EmptyString < $1.creditCardType ?? Constants.CommonStrings.EmptyString })
    }
}
