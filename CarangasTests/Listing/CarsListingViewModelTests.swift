//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

    //System under test SUT, objeto que esta sendo testado, convensao de nome
    var sut: CarsListingViewModel!
    
    override func setUp() {
        super.setUp()
        sut = CarsListingViewModel(service: CarAPIStub())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCount() {
        //Given
        
        
        //When
        sut.loadCars()
        
        //Then
        let expectedResult = 8
        XCTAssertEqual(sut.count, expectedResult, "Total de carros diferente do esperado")
    }
    
    func testFirstCarInfo(){
        //Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        //When
        sut.loadCars()
        let carVisualizationViewModel = sut.getCarVisualizationViewModel(indexPath)
        
        //Then
        XCTAssertEqual(carVisualizationViewModel.title, "M3", "Nome do carro errado")
        XCTAssertEqual(carVisualizationViewModel.brand, "Marca: Acura", "Marca do carro errada")
    }
}
