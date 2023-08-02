//
//  CardBackground.swift
//  CardPac
//
//  Created by rogenesagmit on 8/2/23.
//

import SwiftUI

struct CardBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.blue)
            .cornerRadius(20)
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
    
}

//struct CardBackground_Previews: PreviewProvider {
//    static var previews: some View {
//        CardBackground()
//    }
//}
