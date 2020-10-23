//
//  CarangasUITests.swift
//  CarangasUITests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest

class CarangasUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
       //Given
        let app = XCUIApplication()
        app.launch()
        
        //When
        let cell = app.tables["carsListTable"].cells.firstMatch //Identificadores definidos no storyboard Listing.storyboard
        XCTAssertTrue(cell.waitForExistence(timeout: 10.0)) //Aguarda por 5 segundos a existencia da celula
        
        let cellTitleLabelText = cell.staticTexts["carsCellTitle"].label //Texto do label da navigationbar
        XCTAssertFalse(cellTitleLabelText.isEmpty)
        
        cell.tap() //Simula um toque na celula
        
        //Then
        XCTAssertTrue(app.navigationBars[cellTitleLabelText].exists, "Tela errada") //Indenficada pelo proprio texto
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
