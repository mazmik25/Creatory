//
//  OnceUponVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class OnceUponVC: UIViewController {

    @IBOutlet weak var childView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        childView.addGestureRecognizer(tap)
        
    }

    @objc func dismissVC() {
        removeFromParent()
    }
}
