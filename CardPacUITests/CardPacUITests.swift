//
//  CardPacUITests.swift
//  CardPacUITests
//
//  Created by rogenesagmit on 8/1/23.
//

import XCTest

class CardPacUITests: XCTestCase {
    
    // To check if the button is changing its label
    func testShowBookmarkedOrShowAllCardsButton() throws {
        
        let app = XCUIApplication()
        app.launch()

        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]
        showOnlyBookmarkedCardsButton.tap()
        
        // After the first tap on the button, the label should change to Show All Cards
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show All Cards")
        let showAllCardsButton = app.buttons["Show All Cards"]
        showAllCardsButton.tap()
        
        // After the second tap on the button, the label should change back to Show only Bookmarked Cards
        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show only Bookmarked Cards")
        
    }

    // Test if tapping the cells are working, then tap the button two times
    func testShowBookmarkedAndAllCards() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.firstMatch
        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]

        XCTAssertTrue(table.waitForExistence(timeout: 5.0))
        
        // Get the first cell (row) in the table and tap on it
        let firstCard  = table.cells.element(boundBy : 0)
        let secondCard = table.cells.element(boundBy : 5)
        let thirdCard  = table.cells.element(boundBy : 15)
        
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
    
    // Test if the tapped cards would be displayed in Show only Bookmarked Cards
    func testSaveAndShowBookmarkedCards() throws {
        
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.firstMatch
        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]

        XCTAssertTrue(table.waitForExistence(timeout: 5.0))

        // Get the first cell (row) in the table and tap on it
        let firstCard  = table.cells.element(boundBy: 1)
        let secondCard = table.cells.element(boundBy: 3)
        let thirdCard  = table.cells.element(boundBy: 5)
        let fourthCard = table.cells.element(boundBy: 7)
        let fifthCard  = table.cells.element(boundBy: 9)

        firstCard.tap()
        secondCard.tap()
        thirdCard.tap()
        fourthCard.tap()
        fifthCard.tap()
        
        showOnlyBookmarkedCardsButton.tap()

        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show All Cards")
        XCTAssertEqual(table.cells.count, 10)
        
    }
    
    // Test if the removed bookmarked cards would be undisplayed in Show only Bookmarked Cards
    func testRemoveBookmarkedCards() throws {
        
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.firstMatch
        let showOnlyBookmarkedCardsButton = app.buttons["Show only Bookmarked Cards"]

        XCTAssertTrue(table.waitForExistence(timeout: 5.0))

        // Get the first cell (row) in the table and tap on it
        let firstCard  = table.cells.element(boundBy: 1)
        let secondCard = table.cells.element(boundBy: 3)
        let thirdCard  = table.cells.element(boundBy: 5)
        let fourthCard = table.cells.element(boundBy: 7)
        let fifthCard  = table.cells.element(boundBy: 9)

        firstCard.tap()
        secondCard.tap()
        thirdCard.tap()
        fourthCard.tap()
        fifthCard.tap()
        
        showOnlyBookmarkedCardsButton.tap()

        XCTAssertEqual(showOnlyBookmarkedCardsButton.label, "Show All Cards")
        
        firstCard.tap()
        
        XCTAssertEqual(table.cells.count, 8)
        
    }
    
}
