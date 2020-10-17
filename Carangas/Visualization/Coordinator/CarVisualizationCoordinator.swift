//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarVisualizationCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    var carVisualizationViewModel: CarVisualizationViewModel
    
    init(navigationController: UINavigationController, carVisualizatonViewModel: CarVisualizationViewModel){
        self.navigationController = navigationController
        self.carVisualizationViewModel = carVisualizatonViewModel
    }
    
    func start() {
        let viewController = CarViewController.instantiateFromStoryboard(.visualization)
        viewController.viewModel = carVisualizationViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func editCar(viewModel: CarFormViewModel){
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, carFormViewModel: viewModel)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        if let child = child {
            remove(childCoordinator: child)
        } else{
             parentCoordinator?.childDidFinish(self)
        }
    }
    
    deinit {
        print("CarVisualizationCoordinator -> deinit")
    }
}
