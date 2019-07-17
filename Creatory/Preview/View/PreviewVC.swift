//
//  PreviewVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class PreviewVC: BaseVC {
    
    var story: Story!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func initBadge() {
        var count = Preference.getInt(forKey: .badgesCount)
        count += 1
        switch count {
        case 1: break
            
        case 3: break
            
        default: break
            
        }
        
        saveBadge()
        Preference.set(value: count, forKey: .badgesCount)
    }
    
    private func saveBadge() {
        guard let context = getManagedContextObject() else { return }
        var badge = Badge(context: context)
        badge.story = story
    }

}
