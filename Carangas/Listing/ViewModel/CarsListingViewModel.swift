//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Usuário Convidado on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation

class CarsListingViewModel{
    
    // MARK: - Properties
    private var cars: [Car] = []{
        didSet{
            carsDidUpdate?()
        }
    }
    private var service: CarAPIProtocol// CarAPI()
    
    init(service: CarAPIProtocol = CarAPI()){
        self.service = service
    }
    
    var carsDidUpdate: (() -> Void)?
    
    //Se a propriedade computada tem apenas uma linha, náo e necessario escrever return
    var count: Int {
        cars.count
    }
    
    // MARK: - Methods
    func loadCars(){
        CarAPI().loadCars { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let cars):
                self.cars = cars
                
            case .failure:
                self.carsDidUpdate?()
            }
        }
    }
    
    private func getCar(at indexPath: IndexPath) -> Car{
        cars[indexPath.row]
    }
    
    func cellViewModelFor(_ indexPath: IndexPath) -> CarCellViewModel{
        CarCellViewModel(car: getCar(at: indexPath))
    }
    
    func deleteCar(at indexPath: IndexPath, onComplete: @escaping(Result<Void, APIError>)->Void){
        let car = getCar(at: indexPath)
        service.deleteCar(car) { [weak self] (result) in
            switch result {
            case .success:
                self?.cars.remove(at: indexPath.row)
            case .failure:
                break
            }
            onComplete(result)
        }
    }
    
    func getCarVisualizationViewModel(_ indexPath: IndexPath) -> CarVisualizationViewModel{
        CarVisualizationViewModel(car: getCar(at: indexPath))
    }
}
