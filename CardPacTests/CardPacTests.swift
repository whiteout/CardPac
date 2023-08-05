//
//  CardPacTests.swift
//  CardPacTests
//
//  Created by rogenesagmit on 8/1/23.
//

import XCTest
import SwiftUI
@testable import CardPac

class CardPacTests: XCTestCase {
    
    func testBookmarkedCardsIsEmpty() throws {
        
        let cardViewModel = CardViewModel()
        
        XCTAssert(cardViewModel.bookmarkedCards.isEmpty)
    }
    
    func testSaveBookmarkedCards() throws {
        
        let cardViewModel = CardViewModel()
        let testCard = Card(id: 1,
                            uid: "69d037e8-2cba-4186-a92f-5e76ddbeba00",
                            creditCardNumber: "123",
                            creditCardExpiryDate: "02/02/2025",
                            creditCardType: "Visa")
        
        XCTAssert(cardViewModel.bookmarkedCards.isEmpty)
        
        cardViewModel.saveBookmarkedCard(card: testCard)
        let firstBookmarkCard = cardViewModel.bookmarkedCards.first
        
        XCTAssertEqual(cardViewModel.bookmarkedCards.count, 1)
        XCTAssertEqual(firstBookmarkCard?.id, testCard.id)
    }
    
    func testRemoveBookmarkedCards() throws {
        let cardViewModel = CardViewModel()
        
        let testCard1 = Card(id: 1,
                             uid: "69d037e8-2cba-4186-a92f-5e76ddbeba00",
                             creditCardNumber: "123",
                             creditCardExpiryDate: "02/02/2025",
                             creditCardType: "Visa")
        let testCard2 = Card(id: 2,
                             uid: "69d037e8-2cba-4186-a92f-5e76ddbeba00",
                             creditCardNumber: "123",
                             creditCardExpiryDate: "02/02/2025",
                             creditCardType: "Visa")
        
        XCTAssert(cardViewModel.bookmarkedCards.isEmpty)
        
        
        cardViewModel.saveBookmarkedCard(card: testCard1)
        cardViewModel.saveBookmarkedCard(card: testCard2)
        
        XCTAssertEqual(cardViewModel.bookmarkedCards.count, 2)
        
        // When (try to save a bookmarked card again)
        cardViewModel.saveBookmarkedCard(card: testCard1)
        
        // Then (the bookmarked card should be removed)
        XCTAssertEqual(cardViewModel.bookmarkedCards.count, 1)
    }
    
    func testGroupedSortedCards() {
        // Given
        let cardViewModel = CardViewModel()
        
        cardViewModel.cards = [Card(id: 1, uid: "1", creditCardNumber: "1", creditCardExpiryDate: "1/1/2031", creditCardType: "Visa"),
                               Card(id: 2, uid: "2", creditCardNumber: "1", creditCardExpiryDate: "1/1/2031", creditCardType: "Visa"),
                               Card(id: 3, uid: "3", creditCardNumber: "1", creditCardExpiryDate: "1/1/2031", creditCardType: "MasterCard"),
                               Card(id: 4, uid: "4", creditCardNumber: "1", creditCardExpiryDate: "1/1/2031", creditCardType: "AmericanExpress")]
        
        let groupedCards = cardViewModel.groupedSortedCards()
        
        // the grouped cards should be sorted by credit card type
        XCTAssertEqual(groupedCards.count, 3)
        XCTAssertEqual(groupedCards["Visa"]?.count, 2)
        XCTAssertEqual(groupedCards["MasterCard"]?.count, 1)
        XCTAssertEqual(groupedCards["AmericanExpress"]?.count, 1)
    }
    
    func testShowBookmarkedCards() {
        let cardViewModel = CardViewModel()
        
        XCTAssertEqual(cardViewModel.isShowBookmarkedCards, false)
        
        cardViewModel.showBookmarkedCards()
        
        // Initial toggle
        XCTAssertEqual(cardViewModel.isShowBookmarkedCards, true)
        
        // Toggle again
        cardViewModel.showBookmarkedCards()
        
        // Then (should be back to original state)
        XCTAssertEqual(cardViewModel.isShowBookmarkedCards, false)
    }
    
    func testSortedCards() {
        let cardViewModel = CardViewModel()
        
        cardViewModel.cards = [Card(id: 1,
                                    uid: "1", creditCardNumber: "1",
                                    creditCardExpiryDate: "1/1/2031",
                                    creditCardType: "Visa"),
                               Card(id: 2, uid: "2",
                                    creditCardNumber: "1",
                                    creditCardExpiryDate: "1/1/2031",
                                    creditCardType: "MasterCard"),
                               Card(id: 3, uid: "3",
                                    creditCardNumber: "1",
                                    creditCardExpiryDate: "1/1/2031",
                                    creditCardType: "AmericanExpress")]
        
        // This array is for bookmarked cards
        cardViewModel.bookmarkedCards = [Card(id: 4,
                                              uid: "5",
                                              creditCardNumber: "1",
                                              creditCardExpiryDate: "1/1/2031",
                                              creditCardType: "Visa")]
        
        // This array is for all cards
        let sortedCards1 = cardViewModel.sortedCards()
        
        // Show only bookmarked cards
        cardViewModel.showBookmarkedCards()
        
        // sortedCards2 will have bookmarked cards
        let sortedCards2 = cardViewModel.sortedCards()
        
        // Check if their first index is equal to their corresponding card
        XCTAssertEqual(sortedCards1.first?.creditCardType, "AmericanExpress")
        XCTAssertEqual(sortedCards2.first?.creditCardType, "Visa")
    }
    
    // Test the modifiedSectionHeaderText function for each card type
    func testModifiedSectionHeaderText() {
        
        let cardViewModel = CardViewModel()

        let americanExpress = cardViewModel.modifiedSectionHeaderText(for: "american_express")
        let dankort = cardViewModel.modifiedSectionHeaderText(for: "dankort")
        let dinersClub = cardViewModel.modifiedSectionHeaderText(for: "diners_club")
        let discover = cardViewModel.modifiedSectionHeaderText(for: "discover")
        let forbrugsforeningen = cardViewModel.modifiedSectionHeaderText(for: "forbrugsforeningen")
        let jcb = cardViewModel.modifiedSectionHeaderText(for: "jcb")
        let laser = cardViewModel.modifiedSectionHeaderText(for: "laser")
        let maestro = cardViewModel.modifiedSectionHeaderText(for: "maestro")
        let masterCard = cardViewModel.modifiedSectionHeaderText(for: "mastercard")
        let solo = cardViewModel.modifiedSectionHeaderText(for: "solo")
        let switchCard = cardViewModel.modifiedSectionHeaderText(for: "switch")
        let visa = cardViewModel.modifiedSectionHeaderText(for: "visa")
        
        // Check if renamed properly to be displayed in section header
        XCTAssertEqual(americanExpress, Text(Constants.CreditCardTypes.AmericanExpress))
        XCTAssertEqual(dankort, Text(Constants.CreditCardTypes.Dankort))
        XCTAssertEqual(dinersClub, Text(Constants.CreditCardTypes.DinersClub))
        XCTAssertEqual(discover, Text(Constants.CreditCardTypes.Discover))
        XCTAssertEqual(forbrugsforeningen, Text(Constants.CreditCardTypes.Forbrugsforeningen))
        XCTAssertEqual(jcb, Text(Constants.CreditCardTypes.Jcb))
        XCTAssertEqual(laser, Text(Constants.CreditCardTypes.Laser))
        XCTAssertEqual(maestro, Text(Constants.CreditCardTypes.Maestro))
        XCTAssertEqual(masterCard, Text(Constants.CreditCardTypes.MasterCard))
        XCTAssertEqual(solo, Text(Constants.CreditCardTypes.Solo))
        XCTAssertEqual(switchCard, Text(Constants.CreditCardTypes.Switch))
        XCTAssertEqual(visa, Text(Constants.CreditCardTypes.Visa))
    }

    // For testing of fetchCards
    class MockCardService: CardServiceDelegate {
        func getCards(completion: @escaping (Result<[Card], NetworkError>) -> Void) {
            let mockCards = [Card(id: 1,
                                  uid: "1", creditCardNumber: "1",
                                  creditCardExpiryDate: "1/1/2031",
                                  creditCardType: "Visa"),
                             Card(id: 2, uid: "2",
                                  creditCardNumber: "1",
                                  creditCardExpiryDate: "1/1/2031",
                                  creditCardType: "MasterCard"),
                             Card(id: 3, uid: "3",
                                  creditCardNumber: "1",
                                  creditCardExpiryDate: "1/1/2031",
                                  creditCardType: "AmericanExpress")]
            completion(.success(mockCards))
        }
    }
    
    var cardViewModel: CardViewModel!
    
    override func setUp() {
        super.setUp()
        cardViewModel = CardViewModel(serviceHandler: MockCardService())
    }
    
    override func tearDown() {
        cardViewModel = nil
        super.tearDown()
    }
    
    func testFetchCards() {
        
        XCTAssertEqual(cardViewModel.cards.count, 0)
        
        cardViewModel.fetchCards()
        
        // Wait for the async task to complete
        let expectation = XCTestExpectation(description: "Wait for fetchCards to complete")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        XCTAssertEqual(cardViewModel.cards.count, 3)
    }
    
}
