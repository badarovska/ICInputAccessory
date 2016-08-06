//
//  ICTokenFieldUITests.swift
//  ICInputAccessoryUITests
//
//  Created by Ben on 08/03/2016.
//  Copyright © 2016 Polydice, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest

class ICTokenFieldUITests: XCTestCase {

  override func setUp() {
    super.setUp()
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testTokenField() {
    let app = XCUIApplication()
    let tablesQuery = app.tables
    let textField = tablesQuery.cells.containing(.staticText, identifier:"ICTokenField").children(matching: .textField).element

    textField.tap()
    textField.typeText("Try")
    textField.typeText(" ")
    textField.typeText("iCook")
    textField.typeText(",")
    textField.typeText("beta")
    textField.typeText(" ")

    let deleteKey = app.keys["delete"]
    deleteKey.tap()
    deleteKey.tap()

    textField.typeText("TestFlight")
    textField.typeText(",")

    let searchButton = app.buttons["Search"]
    searchButton.tap()
  }

  func testCustomizedTokenField() {
    let app = XCUIApplication()
    app.tables.staticTexts["CustomizedTokenField"].tap()

    let tokenField = app.navigationBars["Example.CustomizedTokenView"].scrollViews.children(matching: .textField).element
    tokenField.typeText("Try")
    tokenField.typeText(" ")
    tokenField.typeText("iCook")
    tokenField.typeText(",")
    tokenField.typeText("beta")
    tokenField.typeText(" ")

    let deleteKey = app.keys["delete"]
    deleteKey.tap()
    deleteKey.tap()

    tokenField.typeText("TestFlight")
    tokenField.typeText(",")

    let searchButton = app.buttons["Search"]
    searchButton.tap()
  }

  func testStoryboard() {
    let app = XCUIApplication()
    let tablesQuery = app.tables
    tablesQuery.buttons["Storyboard"].tap()

    let tokenField = tablesQuery.cells.containing(.staticText, identifier:"Storyboard ICTokenField").children(matching: .textField).element
    tokenField.tap()
    tokenField.typeText("Try")
    tokenField.typeText(" ")
    tokenField.typeText("iCook")
    tokenField.typeText(",")
    tokenField.typeText("beta")
    tokenField.typeText(" ")

    let deleteKey = app.keys["delete"]
    deleteKey.tap()
    deleteKey.tap()

    tokenField.typeText("TestFlight")
    tokenField.typeText(",")

    let searchButton = app.buttons["Search"]
    searchButton.tap()

    tablesQuery.buttons["Back to Code"].tap()
  }

}
