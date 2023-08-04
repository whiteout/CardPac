//
//  CardDetailsView.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import SwiftUI

struct CardDetailsView: View {
    var cardModel: Card
    @State var isBookmarked = false
    @ObservedObject var cardViewModel: CardViewModel
    
    var body: some View {
        VStack {

        }.cardBackground(uid: cardModel.uid?.codingKey.stringValue ?? Constants.CommonStrings.EmptyString,
                         creditCardNumberText: cardModel.creditCardNumber?.codingKey.stringValue ?? Constants.CommonStrings.EmptyString,
                         creditCardExpiryDate: cardModel.creditCardExpiryDate ?? Constants.CommonStrings.EmptyString,
                         creditCardType: cardModel.creditCardType ?? Constants.CommonStrings.EmptyString,
                         creditCardLogo: cardModel.creditCardType ?? Constants.CommonStrings.EmptyString,
                         isBookmarked: $isBookmarked)
            .listRowBackground(Color.clear)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .onTapGesture {
                isBookmarked.toggle()
                // Call the method in the view model to save the selected card
                cardViewModel.saveBookedmarkCard(card: cardModel)
            }
    }
}

//view extension for better modifier access
extension View {
    func cardBackground(uid: String, creditCardNumberText: String, creditCardExpiryDate: String, creditCardType: String, creditCardLogo: String, isBookmarked: Binding<Bool>) -> some View {
        modifier(CardBackground(uid: uid,
                                creditCardNumberText: creditCardNumberText,
                                creditCardExpiryDate: creditCardExpiryDate,
                                creditCardType: creditCardType,
                                creditCardLogo: creditCardLogo,
                                isBookmarked: isBookmarked))
    }
}
