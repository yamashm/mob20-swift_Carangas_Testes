//
//  CarAPITests.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import Carangas

class CarAPITests: XCTestCase {

    var sut: CarAPI!
    
    override func setUp() {
        super.setUp()
        sut = CarAPI()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testLoadCarsResponseSuccess(){
        //Given
        let promise = expectation(description: "Sucesso")
        
        //When
        sut.loadCars { (result) in
            defer{ //Sempre executado ao sair do metodo
                promise.fulfill()
            }
            switch result{
            case .success:
                XCTAssertTrue(true)
            case .failure(let apiError):
                XCTFail(apiError.errorMessage)
            }
        }
        
        //Then
        wait(for: [promise], timeout: 3.0)
    }

}
