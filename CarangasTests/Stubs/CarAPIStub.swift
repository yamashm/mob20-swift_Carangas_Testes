//
//  CarAPIStub.swift
//  CarangasTests
//
//  Created by Usuário Convidado on 22/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
@testable import Carangas

//Stub é um Mock
class CarAPIStub: NSObject, CarAPIProtocol{
    func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
        let bundle = Bundle(for: CarAPIStub.self)
        let url = bundle.url(forResource: "CarsMocked2", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let cars = try! JSONDecoder().decode([Car].self, from: data)
        onComplete(.success(cars))
    }
    
    func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        onComplete(.success(()))
    }
}
