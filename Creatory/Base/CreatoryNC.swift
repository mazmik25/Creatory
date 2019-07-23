//
//  CreatoryNC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import CoreData

class CreatoryNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFirstNotTimeLaunch() {
            let vc = LibraryVC()
            viewControllers = [vc]
        } else {
            createBadges()
            let vc = SelectRoleVC()
            viewControllers = [vc]
        }
        
    }
    
    private func isFirstNotTimeLaunch() -> Bool {
        return Preference.getBool(forKey: .isFirstNotTimeLaunch) ?? false
    }
    
    private func createBadges() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = delegate.persistentContainer.viewContext
        
        let numberOfBadges = 5
        for i in 0..<numberOfBadges {
            let badge = BadgeModel(context: context)
            badge.save(name: "Badges-\(i+1)", isReceived: false)
        }
    }

}
