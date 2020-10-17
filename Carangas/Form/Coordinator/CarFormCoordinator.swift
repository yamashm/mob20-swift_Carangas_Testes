//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarFormCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    let carFormViewModel: CarFormViewModel
    
    init(navigationController: UINavigationController, carFormViewModel: CarFormViewModel = CarFormViewModel()){
        self.navigationController = navigationController
        self.carFormViewModel = carFormViewModel
    }
    
    func start() {
        let viewController = AddEditViewController.instantiateFromStoryboard(.form)
        viewController.viewModel = carFormViewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
           parentCoordinator?.childDidFinish(self)
       }
       
       deinit {
           print("CarFormCoordinator -> deinit")
       }
}
