//
//  AlertService.swift
//  Creatory
//
//  Created by Juansyah - on 18/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class AlertService {
    func alert() -> AlertViewPopUp {
        let storyboard = UIStoryboard(name: "AlertPopUp", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewPopUp
        return alertVC
    }
}
