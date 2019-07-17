//
//  UIViewController+Extension.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

extension UIViewController {
    func dismissPopup() {
        removeFromParent()
        self.view.removeFromSuperview()
    }
}
