//
//  NodaTrainerUIBusinessTests.swift
//  NodaTrainerUITests
//
//  Created by sangeles on 6/22/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import XCTest

class NodaTrainerUIBusinessTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAddNewMusicEvent() {
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 2).tap()
        XCUIDevice.shared.orientation = .portrait
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element.tap()
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        
        let yKey = app/*@START_MENU_TOKEN@*/.keys["y"]/*[[".keyboards.keys[\"y\"]",".keys[\"y\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yKey.tap()
        yKey.tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
        element.children(matching: .textField).element(boundBy: 2).tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["G"]/*[[".keyboards.keys[\"G\"]",".keys[\"G\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        aKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["u"]/*[[".keyboards.keys[\"u\"]",".keys[\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let jKey = app2/*@START_MENU_TOKEN@*/.keys["j"]/*[[".keyboards.keys[\"j\"]",".keys[\"j\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        jKey.tap()
        element.children(matching: .textField).element(boundBy: 3).tap()
        key2.tap()
        app2/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key.tap()
        app2/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["7"]/*[[".keyboards.keys[\"7\"]",".keys[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key2.tap()
        app2/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.children(matching: .textView).element(boundBy: 0).tap()
        app2/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        nKey.tap()
        yKey.tap()
        yKey.tap()
        element.tap()
        
        let textView = element.children(matching: .textView).element(boundBy: 1)
        textView.tap()
        app2/*@START_MENU_TOKEN@*/.keys["N"]/*[[".keyboards.keys[\"N\"]",".keys[\"N\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let hKey = app2/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        nKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.tap()
        textView.tap()
        app2/*@START_MENU_TOKEN@*/.keys["delete"].press(forDuration: 0.8);/*[[".keyboards.keys[\"delete\"]",".tap()",".press(forDuration: 0.8);",".keys[\"delete\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app2/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        hKey.tap()
        element.tap()
        app.buttons["PUBLICAR"].tap()
        
        
    }
    
    func testAddNewInstrumentPost() {
        let app = XCUIApplication()
        let app2 = app
        app.tabBars.children(matching: .button).element(boundBy: 2).tap()
        
        app2/*@START_MENU_TOKEN@*/.buttons["Venta de Instrumentos"]/*[[".segmentedControls.buttons[\"Venta de Instrumentos\"]",".buttons[\"Venta de Instrumentos\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element.tap()
        element.children(matching: .textField).element(boundBy: 0).tap()
        app2/*@START_MENU_TOKEN@*/.keys["p"]/*[[".keyboards.keys[\"p\"]",".keys[\"p\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let aKey = app2/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["space"]/*[[".keyboards.keys[\"space\"]",".keys[\"space\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let rKey = app2/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        
        let eKey = app2/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        rKey.tap()
        aKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        eKey.tap()
        eKey.tap()
        app2/*@START_MENU_TOKEN@*/.otherElements["release"]/*[[".keyboards",".otherElements[\"Typing Predictions\"].otherElements[\"release\"]",".otherElements[\"release\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.children(matching: .textField).element(boundBy: 1).tap()
        
        let key = app2/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        
        let key2 = app2/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        
        let key3 = app2/*@START_MENU_TOKEN@*/.keys["8"]/*[[".keyboards.keys[\"8\"]",".keys[\"8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        
        let key4 = app2/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        key4.tap()
        element.children(matching: .textField).element(boundBy: 2).tap()
        key2.tap()
        key.tap()
        key.tap()
        element.children(matching: .textField).element(boundBy: 3).tap()
        key2.tap()
        key.tap()
        key4.tap()
        key4.tap()
        key3.tap()
        key2.tap()
        key3.tap()
        key4.tap()
        key4.tap()
        element.children(matching: .textField).element(boundBy: 4).tap()
        key3.tap()
        key3.tap()
        key.tap()
        
        let textView = element.children(matching: .textView).element(boundBy: 0)
        textView.tap()
        element.tap()
        textView.tap()
        app2/*@START_MENU_TOKEN@*/.keys["F"]/*[[".keyboards.keys[\"F\"]",".keys[\"F\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["j"]/*[[".keyboards.keys[\"j\"]",".keys[\"j\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["v"]/*[[".keyboards.keys[\"v\"]",".keys[\"v\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.tap()
        app.buttons["PUBLICAR"].tap()
        
    }

}
