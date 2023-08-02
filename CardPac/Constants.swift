//
//  Constants.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation
import SwiftUI

class Constants: NSObject {

    struct URLs {
        public static let BASE_URL = "https://random-data-api.com/api/v2/credit_cards?size=100"
    }

    struct TITLE {
        public static let CARD_LIST = "Card List"
    }
    
    struct COMMON_STRINGS {
        public static let EMPTY_STRING = "-"
        public static let VALID_UP_TO  = "Valid up to:"
    }
    
    struct APIErrorMessages {
    
    }
    
    struct CREDIT_CARD_TYPES {
        public static let AMERICAN_EXPRESS   = "American Express"
        public static let DANKORT            = "Dankort"
        public static let DINERS_CLUB        = "Diners Club"
        public static let DISCOVER           = "Discover"
        public static let FORBRUGSFORENINGEN = "Forbrugsforeningen"
        public static let JCB                = "JCB"
        public static let LASER              = "Laser"
        public static let MAESTRO            = "Maestro"
        public static let MASTER_CARD        = "Mastercard"
        public static let SOLO               = "Solo"
        public static let SWITCH             = "Switch"
        public static let VISA               = "Visa"
    }
    
}
