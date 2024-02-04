//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Osman Emre Ömürlü on 4.02.2024.
//

import XCTest

final class SwiftTestingUITests: XCTestCase {
    
    
    func testToDoItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let textField =  app.alerts["Add item"].scrollViews.otherElements.collectionViews.textFields["Enter item"]
        
        let okBUtton = app.alerts["Add item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do 2")
        okBUtton.tap()
        
        XCTAssertTrue(addedCell.exists)
        
        
    }
    
    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let textField =  app.alerts["Add item"].scrollViews.otherElements.collectionViews.textFields["Enter item"]
        
        let okBUtton = app.alerts["Add item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        //tables
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
        
    }
}
