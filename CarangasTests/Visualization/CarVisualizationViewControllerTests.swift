//
//  CarVisualizationViewControllerTests.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarVisualizationViewControllerTests: XCTestCase {

    var sut: CarViewController!
    var car: Car = {
        var car = Car()
        car.name = "Civic"
        car.brand = "Honda"
        car.price = 25000
        car.gasType = 0
        return car
    }()
    
    override func setUp() {
        super.setUp()
        sut = CarViewController.instantiateFromStoryboard(.visualization)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testVisualizationOfCar(){
        //Given
        sut.viewModel = CarVisualizationViewModel(car: car)
        sut.loadView()
        
        //When
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        //Then
        XCTAssertEqual(sut.title, "Civic", "Título da controller errado")
        XCTAssertEqual(sut.lbBrand.text, "Marca: Honda")
        XCTAssertEqual(sut.lbPrice.text, "Preço: R$ 25.000,00")
        XCTAssertEqual(sut.lbGasType.text, "Combustivel: Flex")
    }
}
