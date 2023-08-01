//
//  CardView.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject private var viewModel = CardViewModel()
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.cards) { card in
                    label:  do {
                            CardDetails(cardModel: card)
                        }
                    }
                }.onAppear() {
                    viewModel.fetchCards()
                }
            }.navigationTitle("Card List")
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}


