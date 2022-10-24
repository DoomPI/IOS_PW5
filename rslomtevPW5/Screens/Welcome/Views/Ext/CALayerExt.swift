//
//  CALayerExt.swift
//  rslomtevPW3
//
//  Created by Роман Ломтев on 23.09.2022.
//

import UIKit

extension CALayer {
    
    func applyShadow() {
        shadowColor = UIColor.gray.cgColor
        shadowOpacity = 0.3
        shadowOffset = .zero
        shadowRadius = 5
    }
}
