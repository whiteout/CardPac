//
//  Card.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

struct Card: Codable, Identifiable {
    let id                   : Int?
    let uid                  : String?
    let creditCardNumber     : String?
    let creditCardExpiryDate : String?
    let creditCardType       : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case uid
        case creditCardNumber     = "credit_card_number"
        case creditCardExpiryDate = "credit_card_expiry_date"
        case creditCardType       = "credit_card_type"
    }
    
    init(id: Int, uid: String, creditCardNumber: String, creditCardExpiryDate: String, creditCardType: String) {
        self.id                   = id
        self.uid                  = uid
        self.creditCardNumber     = creditCardNumber
        self.creditCardExpiryDate = creditCardExpiryDate
        self.creditCardType       = creditCardType
    }
}

enum CreditCardType: String {
    case americanExpress    = "american_express"
    case dankort            = "dankort"
    case dinersClub         = "diners_club"
    case discover           = "discover"
    case forbrugsforeningen = "forbrugsforeningen"
    case jcb                = "jcb"
    case laser              = "laser"
    case maestro            = "maestro"
    case masterCard         = "mastercard"
    case solo               = "solo"
    case switchCard         = "switch"
    case visa               = "visa"
}
