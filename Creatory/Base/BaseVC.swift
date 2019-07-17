//
//  BaseVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import CoreData

class BaseVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func getManagedContextObject() -> NSManagedObjectContext? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate.persistentContainer.viewContext
    }
    
    func viewPopup(withViewController vc: UIViewController, withView view: UIView?, bg: UIColor = .black) {
        self.addChild(vc)
        vc.view.backgroundColor = bg.withAlphaComponent(0.6)
        if let view = view {
            view.addSubview(vc.view)
        } else {
            self.view.addSubview(vc.view)
        }
        
    }

}
