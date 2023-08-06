//
//  CardPacUITests.swift
//  CardPacUITests
//
//  Created by rogenesagmit on 8/1/23.
//

import XCTest

class CardPacUITests: XCTestCase {
    
    func testShowBookmarkedOrShowAllCardsButton() throws {
        
        let app = XCUIApplication()
        app.launch()

        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]
        showOnlyBookmarkedCardsButton.tap()
        
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show All Cards")
        let showAllCardsButton = app.buttons["Show All Cards"]
        showAllCardsButton.tap()
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show only Bookmarked Cards")
        
    }

    func testShowBookmarkedAndAllCards() throws {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.firstMatch
        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]

        XCTAssertTrue(table.waitForExistence(timeout: 5.0))
        
        // Get the first cell (row) in the table and tap on it
        let firstCard  = table.cells.element(boundBy  : 0)
        let secondCard = table.cells.element(boundBy : 5)
        let thirdCard  = table.cells.element(boundBy  : 15)
        
        XCTAssertTrue(firstCard.waitForExistence(timeout: 5.0))
        firstCard.tap()
        secondCard.tap()
        thirdCard.tap()
        
        showOnlyBookmarkedCardsButton.tap()
        
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show All Cards")
        let showAllCardsButton = app.buttons["Show All Cards"]
        showAllCardsButton.tap()
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show only Bookmarked Cards")
    }
    
}
