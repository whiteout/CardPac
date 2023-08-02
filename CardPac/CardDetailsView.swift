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
            Text(cardModel.id?.codingKey.stringValue ?? "NA")
                .font(.title3)
            Text(cardModel.uid?.codingKey.stringValue ?? "NA")
                .font(.title2)
        }.cardBackground()
            .listRowBackground(Color.clear)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
    }
}

// view extension for better modifier access
extension View {
    func cardBackground() -> some View {
        modifier(CardBackground())
    }
}
