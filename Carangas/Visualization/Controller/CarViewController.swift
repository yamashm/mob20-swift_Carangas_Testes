//
//  ViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lbBrand: UILabel!
    @IBOutlet weak var lbGasType: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    // MARK: - Properties
    var viewModel: CarVisualizationViewModel?
    weak var coordinator: CarVisualizationCoordinator?
    
    
    // MARK: - Super Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let viewModel = viewModel {
            title = viewModel.title
            lbBrand.text = viewModel.brand
            lbGasType.text = viewModel.fuelTyp
            lbPrice.text = viewModel.price
            
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let vc = segue.destination as? AddEditViewController {
               vc.viewModel = viewModel?.getCarFormViewModel()
           }
       }
    */
    @IBAction func editCar(_ sender: UIBarButtonItem) {
        guard let viewModel = viewModel else {return}
        coordinator?.editCar(viewModel: viewModel.getCarFormViewModel())
    }
    
    deinit {
        print("CarViewController -> deinit")
        coordinator?.childDidFinish(nil)
    }
}
