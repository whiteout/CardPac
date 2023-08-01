//
//  CardDetails.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import SwiftUI

struct CardDetails: View {
    var cardModel: Card
    var body: some View {
        VStack {
            Text(cardModel.id?.codingKey.stringValue ?? "NA")
                .font(.title3)
            Text(cardModel.uid?.codingKey.stringValue ?? "NA")
                .font(.title2)
        }
    }
}
