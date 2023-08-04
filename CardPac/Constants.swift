//
//  Constants.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation
import SwiftUI

class Constants {

    struct Urls {
        public static let BaseUrl = "https://random-data-api.com/api/v2/credit_cards?size=100"
    }

    struct Title {
        public static let CardList = "Card List"
    }
    
    struct CommonStrings {
        public static let EmptyString = "-"
        public static let ValidUpTo   = "Valid up to :"
    }
    
    struct APIErrorMessages {
    
    }
    
    struct CreditCardTypes {
        public static let AmericanExpress    = "American Express"
        public static let Dankort            = "Dankort"
        public static let DinersClub         = "Diners Club"
        public static let Discover           = "Discover"
        public static let Forbrugsforeningen = "Forbrugsforeningen"
        public static let Jcb                = "JCB"
        public static let Laser              = "Laser"
        public static let Maestro            = "Maestro"
        public static let MasterCard         = "Mastercard"
        public static let Solo               = "Solo"
        public static let Switch             = "Switch"
        public static let Visa               = "Visa"
    }
    
    struct Colors {
        static let linearGradient = LinearGradient(colors: [Color(red: 201/255, green: 0/255, blue: 0/255, opacity: 1), Color.red], startPoint: .bottom, endPoint: .top)
        static let cardForegroundColor = Color.cyan
    }
    
    struct CardUIComponent {
        public static let cardCornerRadius           : CGFloat = 6
        public static let shadowCardCornerRadius     : CGFloat = 5
        public static let creditCardLogoHeight       : CGFloat = 50
        public static let creditCardLogoCornerRadius : CGFloat = 4
        public static let creditCardSpacing          : CGFloat = 20
        public static let creditCardMainTextSpacing  : CGFloat = 6
        public static let cardOpacity                : CGFloat = 0.5
        public static let cardLineWidth              : CGFloat = 1.0
    }
    
    struct FontSize {
        public static let creditCardMainFontSize    : CGFloat = 15
        public static let creditCardSubMainFontSize : CGFloat = 12
    }
}
