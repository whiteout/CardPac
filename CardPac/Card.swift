//
//  Card.swift
//  CardPac
//
//  Created by rogenesagmit on 8/1/23.
//

import Foundation

struct Card: Codable, Identifiable {
    let id                      : Int?
    let uid                     : String?
    let credit_card_number      : String?
    let credit_card_expiry_date : String?
    let credit_card_type        : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case uid
        case credit_card_number
        case credit_card_expiry_date
        case credit_card_type
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
