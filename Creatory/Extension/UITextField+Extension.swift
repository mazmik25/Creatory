//
//  UITextField+Extension.swift
//  Creatory
//
//  Created by Azmi Muhammad on 21/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
