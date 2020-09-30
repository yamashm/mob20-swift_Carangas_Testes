//
//  CarAPI.swift
//  Carangas
//
//  Created by Eric Alves Brito on 29/09/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case decodeError
}


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
    
    private lazy var session = URLSession.shared
    
    func loadCars(onComplete: @escaping (Result<[Car], APIError>) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(.failure(.badURL))
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.taskError))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                onComplete(.failure(.noResponse))
                return
            }
            if !(200...299 ~= response.statusCode) {
                onComplete(.failure(.invalidStatusCode(response.statusCode)))
                return
            }
            guard let data = data else {
                onComplete(.failure(.noData))
                return
            }
            do {
                let cars = try JSONDecoder().decode([Car].self, from: data)
                onComplete(.success(cars))
            } catch {
                onComplete(.failure(.decodeError))
            }
        }
        task.resume()
    }
}

