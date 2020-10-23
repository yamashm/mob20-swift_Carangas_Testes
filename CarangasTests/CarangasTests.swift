//
//  CarangasTests.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest

class CarangasTests: XCTestCase {
    
    override class func setUp() {
        print("1")
    }
    


    //Sempre executado antes do teste, preparar o ambiente
    override func setUp() {
        print("3")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //Sempre executado depois do teste, limpar para o proximo teste
    override func tearDown() {
        print("4")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override class func tearDown() {
        print("6")
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
