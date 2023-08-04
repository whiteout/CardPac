//
//  CardPacTests.swift
//  CardPacTests
//
//  Created by rogenesagmit on 8/1/23.
//

import XCTest
@testable import CardPac

class CardPacTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveBookmark() throws {
        
        let cardViewModel = CardViewModel()
        let testCard = Card(id: 1, uid: "123", creditCardNumber: "123", creditCardExpiryDate: "02/02/2025", creditCardType: "81238")
        
        XCTAssert(cardViewModel.bookmarkedCards.isEmpty)
        
        cardViewModel.saveBookedmarkCard(card: testCard)
        let firstBookmarkCard = cardViewModel.bookmarkedCards.first
        
        XCTAssertEqual(cardViewModel.bookmarkedCards.count, 1)
        XCTAssertEqual(firstBookmarkCard?.id, testCard.id)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
