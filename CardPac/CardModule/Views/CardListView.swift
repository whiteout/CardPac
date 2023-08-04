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
                Button(cardViewModel.isShowBookmarkedCards ? Constants.Title.ShowAllCards : Constants.Title.ShowBookMarks, action: cardViewModel.showBookmarkedCards)
                    .padding()
                List() {
                    ForEach(cardViewModel.groupedSortedCards().keys.sorted(), id: \.self) { key in
                        Section(header: cardViewModel.modifiedSectionHeaderText(for: key)) {
                            ForEach(cardViewModel.groupedSortedCards()[key]!, id: \.id) { card in
                                CardDetailsView(cardModel: card, cardViewModel: cardViewModel)
                            }
                        }
                    }
                }.onAppear() {
                    cardViewModel.fetchCards()
                }
            }.navigationTitle(Constants.Title.CardList)
                .font(.headline)
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
