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
            present(NewStoryVC(), animated: true, completion: nil)
        }
        
    }
    
    private func isFirstNotTimeLaunch() -> Bool {
        return Preference.getBool(forKey: .isFirstNotTimeLaunch) ?? false
    }
    
    private func createBadges() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = delegate.persistentContainer.viewContext
        
        let numberOfBadges = 6
        for i in 0..<numberOfBadges {
            let badge = Badge(context: context)
            badge.name = "Badges-\(i+1)"
            badge.isReceived = false
            
            do {
                try context.save()
            } catch {
                print(error)
            }
            
        }
    }

}
