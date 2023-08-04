//
//  CardBackground.swift
//  CardPac
//
//  Created by rogenesagmit on 8/2/23.
//

import SwiftUI

struct CardBackground: ViewModifier {
    
    var uid                  : String
    var creditCardNumberText : String
    var creditCardExpiryDate : String
    var creditCardType       : String
    var creditCardLogo       : String
    @Binding var isBookmarked: Bool
    
    func body(content: Content) -> some View {
        
        content
        VStack(alignment: .leading, spacing: Constants.CardUIComponent.creditCardSpacing) {
            Image(isBookmarked ? "bookmark_filled" : "bookmark")
            Spacer()
            
            VStack(spacing: Constants.CardUIComponent.creditCardMainTextSpacing) {
                HStack {
                    Spacer()
                    Text(creditCardNumberText)
                        .font(.system(size: Constants.FontSize.creditCardMainFontSize, weight: .semibold, design: .rounded))
                    Spacer()
                }
                
                HStack {
                    Text(uid)
                        .font(.system(size: Constants.FontSize.creditCardSubMainFontSize, weight: .medium))
                }
            }
            
            HStack {
                Text("\(Constants.CommonStrings.ValidUpTo) \(creditCardExpiryDate)")
                    .font(.system(size: Constants.FontSize.creditCardSubMainFontSize, weight: .medium, design: .default))
                Spacer()
                Image("\(creditCardLogo)_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: Constants.CardUIComponent.creditCardLogoHeight)
                    .clipped()
                    .cornerRadius(Constants.CardUIComponent.creditCardLogoCornerRadius)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Constants.Colors.linearGradient)
        .overlayRoundedRectangleWithStroke()
        .cornerRadius(Constants.CardUIComponent.cardCornerRadius)
        .shadow(radius: Constants.CardUIComponent.shadowCardCornerRadius)
        .padding(.horizontal)
    }
    
    
}

extension View {
    func overlayRoundedRectangleWithStroke() -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: Constants.CardUIComponent.cardCornerRadius)
                .stroke(Color.black.opacity(Constants.CardUIComponent.cardOpacity), lineWidth: Constants.CardUIComponent.cardLineWidth)
        )
    }
}
