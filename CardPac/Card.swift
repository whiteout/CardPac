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
