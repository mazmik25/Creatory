//
//  UIView+Extension.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyBorder(width: CGFloat = 0.0, color: UIColor = .blue, radius: Radius) {
        var cornerRadius: CGFloat = 0.0
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        switch radius {
        case .rounded:
            cornerRadius = self.layer.frame.width / 2
        case .quarter:
            cornerRadius = self.layer.frame.width / 4
        case .custom(let value):
            cornerRadius = value
        }
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
