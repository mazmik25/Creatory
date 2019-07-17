//
//  CreatoryNC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class CreatoryNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFirstTimeLaunch() {
            present(NewStoryVC(), animated: true, completion: nil)
        } else {
            let vc = LibraryVC()
            viewControllers = [vc]
        }
        
    }
    
    private func isFirstTimeLaunch() -> Bool {
        return Preference.getBool(forKey: .isFirstTimeLaunch) ?? true
    }

}
