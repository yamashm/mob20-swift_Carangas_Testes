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
    
    var car: Car!
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        return numberFormatter
    }()

    // MARK: - Super Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = car.name
        lbBrand.text = car.brand
        lbGasType.text = car.fuel
        lbPrice.text = numberFormatter.string(from: NSNumber(value: car.price))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddEditViewController {
            vc.car = car
        }
    }
}
