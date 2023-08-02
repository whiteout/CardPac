//
//  CardListView.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import SwiftUI

struct CardListView: View {
    
    @ObservedObject private var cardViewModel = CardViewModel()
    @State private var cards: [Card] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(cardViewModel.cards.sorted(by: { $0.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING < $1.credit_card_type ?? Constants.COMMON_STRINGS.EMPTY_STRING })) { card in
                    label:  do {
                        CardDetailsView(cardModel: card)
                        }
                    }
                }.onAppear() {
                    cardViewModel.fetchCards()
                }
            }.navigationTitle(Constants.TITLE.CARD_LIST)
                .font(.headline)
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
