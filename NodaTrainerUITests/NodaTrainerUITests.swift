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
    
    func testSong2() {
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        let menuimgHomeclickedElement = scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element
        menuimgHomeclickedElement.tap()
        menuimgHomeclickedElement.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 2).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let checkboxCheckedButton = app.buttons["CHECKBOX CHECKED"]
        checkboxCheckedButton.tap()
        
        let okButton = app.alerts["Vuelva a Intentar"].buttons["OK"]
        okButton.tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        
        let button = app.buttons["Button"]
        button.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        button.tap()
        
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element(boundBy: 6).children(matching: .other).element.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        button.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        button.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        window.children(matching: .other).element(boundBy: 12).children(matching: .other).element(boundBy: 0).tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        button.tap()
        siguienteButton.tap()
        playButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        window.children(matching: .other).element(boundBy: 15).children(matching: .other).element.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        checkboxCheckedButton.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection15() {
        
        let app = XCUIApplication()
        let button = app.tabBars.children(matching: .button).element(boundBy: 1)
        button.tap()
        button.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 3).tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        siguienteButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection16() {
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 4).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let button = app.buttons["5ta Justa"]
        button.tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["4ta Justa"]
        button2.tap()
        okButton.tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection17() {
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 5).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let button = app.buttons["2da Mayor"]
        button.tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["3ra Mayor"]
        button2.tap()
        okButton.tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection18() {
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        let menuimgHomeclickedElement = scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element
        menuimgHomeclickedElement.tap()
        XCUIDevice.shared.orientation = .faceUp
        menuimgHomeclickedElement.tap()
        XCUIDevice.shared.orientation = .portrait
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 6).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let button = app.buttons["2da Menor"]
        button.tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["3ra Menor"]
        button2.tap()
        okButton.tap()
        
        let siguienteButton = app.buttons["SIGUIENTE"]
        siguienteButton.tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        XCUIDevice.shared.orientation = .faceUp
        siguienteButton.tap()
        XCUIDevice.shared.orientation = .portrait
        playButton.tap()
        XCUIDevice.shared.orientation = .faceUp
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        siguienteButton.tap()
        playButton.tap()
        XCUIDevice.shared.orientation = .portrait
        XCUIDevice.shared.orientation = .faceUp
        button.tap()
        XCUIDevice.shared.orientation = .portrait
        okButton.tap()
        button2.tap()
        okButton.tap()
        XCUIDevice.shared.orientation = .faceUp
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection19() {
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.swipeUp()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 7).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let button = app.buttons["5ta Disminuida"]
        button.tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["5ta Subdisminuida"]
        button2.tap()
        okButton.tap()
        app.buttons["SIGUIENTE"].tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
    }
    
    func testLection20() {
        
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"MENUIMG HOMECLICKED").element.tap()
        scrollViewsQuery.children(matching: .image).matching(identifier: "avatar").element(boundBy: 8).tap()
        
        let playButton = app.buttons["PLAY"]
        playButton.tap()
        
        let button = app.buttons["4ta Aumentada"]
        button.tap()
        
        let okButton = app.alerts["Resultado"].buttons["OK"]
        okButton.tap()
        
        let button2 = app.buttons["4ta Superaumentada"]
        button2.tap()
        okButton.tap()
        app.buttons["SIGUIENTE"].tap()
        playButton.tap()
        button.tap()
        okButton.tap()
        button2.tap()
        okButton.tap()
        app.buttons["COMPLETAR LECCIÓN"].tap()
        
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
