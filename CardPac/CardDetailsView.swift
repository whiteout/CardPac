//
//  CardDetailsView.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import SwiftUI

struct CardDetailsView: View {
    var cardModel: Card
    var body: some View {
        VStack {

        }.cardBackground(uid: cardModel.uid?.codingKey.stringValue ?? Constants.COMMON_STRINGS.EMPTY_STRING,
                         creditCardNumberText: cardModel.credit_card_number?.codingKey.stringValue ?? Constants.COMMON_STRINGS.EMPTY_STRING,
                         creditCardExpiryDate: cardModel.credit_card_expiry_date ?? Constants.COMMON_STRINGS.EMPTY_STRING,
                         creditCardType: cardModel.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING,
                         creditCardLogo: cardModel.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING)
            .listRowBackground(Color.clear)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
    }
}

//view extension for better modifier access
extension View {
    func cardBackground(uid: String, creditCardNumberText: String, creditCardExpiryDate: String, creditCardType: String, creditCardLogo: String) -> some View {
        modifier(CardBackground(uid: uid,
                                creditCardNumberText: creditCardNumberText,
                                creditCardExpiryDate: creditCardExpiryDate,
                                creditCardType: creditCardType,
                                creditCardLogo: creditCardLogo))
    }
}
