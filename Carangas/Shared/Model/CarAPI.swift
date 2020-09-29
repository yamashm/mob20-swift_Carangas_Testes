//
//  CarAPI.swift
//  Carangas
//
//  Created by Eric Alves Brito on 29/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

class CarAPI {
    
    private let basePath = "https://carangas.herokuapp.com/cars"
    private let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        configuration.timeoutIntervalForRequest = 60
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
    }()
    
    private lazy var session = URLSession(configuration: configuration)
    
    func loadCars() {
        guard let url = URL(string: basePath) else {
            return
        }
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                return print(error)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return print("Objeto response vazio!")
            }
            
            if !(200...299 ~= response.statusCode) {
                return print("Status code inválido:", response.statusCode)
            }
            
            guard let data = data else {
                return print("Sem dados!!!")
            }
            
            do {
                let cars = try JSONDecoder().decode([Car].self, from: data)
                print("Você tem um total de \(cars.count) carros")
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

