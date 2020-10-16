//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Usuário Convidado on 15/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

protocol VehicleCellViewModelProtocol{
    var name: String {get}
    var brand: String {get}
}

class CarTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: VehicleCellViewModelProtocol){
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.brand
    }

}
