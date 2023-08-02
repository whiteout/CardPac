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
    
    
    func body(content: Content) -> some View {
        content
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Spacer()
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .clipped()
                    .cornerRadius(4)
            }
            
            VStack(spacing: 6) {
                HStack {
                    Spacer()
                    Text(creditCardNumberText)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                    Spacer()
                }
                
                HStack {
                    Text(uid)
                        .font(.system(size: 12, weight: .medium))
                }
            }
            
            HStack {
                Text("\(Constants.COMMON_STRINGS.VALID_UP_TO) \(creditCardExpiryDate)")
                    .font(.system(size: 12, weight: .medium, design: .serif))
                Spacer()
                Image("\(creditCardLogo)_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .clipped()
                    .cornerRadius(4)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(
            LinearGradient(colors: [Color(red: 176/255, green: 143/255, blue: 38/255, opacity: 1), Color.red], startPoint: .top, endPoint: .bottom)
        )
        .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
        )
        .cornerRadius(6)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    
}
