//
//  NodaTrainerUITests.swift
//  NodaTrainerUITests
//
//  Created by sangeles on 4/15/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import XCTest

class NodaTrainerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLection21() {
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 9).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        app.buttons["Segunda Mayor"].tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        playButton.tap()
        app.buttons["Segunda Menor"].tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        
        let terceraMayorButton = app.buttons["Tercera Mayor"]
        terceraMayorButton.tap()
        okButton.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 2).children(matching: .other).element.tap()
        siguienteButton.tap()
        playButton.tap()
        terceraMayorButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        terceraMayorButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        app.buttons["Tercera Menor"].tap()
        okButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
    }
    
}
