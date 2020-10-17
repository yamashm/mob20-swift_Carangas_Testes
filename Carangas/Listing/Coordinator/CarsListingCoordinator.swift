//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsListingCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsTableViewController.instantiateFromStoryboard(.listing)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showCarWith(viewModel: CarVisualizationViewModel){
        let viewController = CarViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func createCar(viewModel: CarFormViewModel = CarFormViewModel()){
        let viewController = AddEditViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}

