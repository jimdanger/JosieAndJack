//
//  JosieAndJackUITests.swift
//  JosieAndJackUITests
//
//  Created by Jim Wilson on 10/23/16.
//  Copyright © 2016 Jim Danger, LLC. All rights reserved.
//
// swiftlint:disable line_length
// swiftlint:disable trailing_whitespace

import XCTest
import Foundation
@testable import JosieAndJack

class JosieAndJackUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddKid() {

        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp

        let app = XCUIApplication()
        app.buttons["+ add kid"].tap()
        
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("testKid")
        app.buttons["next"].tap()
        app.navigationBars["Birthday"].buttons["skip"].tap()
        let _ = ""
        XCTAssertNotNil(app.buttons["🤰testKid🤰"])
    }
}
