//
//  UIViewController+Instantiate.swift
//  Carangas
//
//  Created by Usuário Convidado on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

extension UIViewController{
    
    static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self{
        let name = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
