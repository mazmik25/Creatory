//
//  ViewController.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class NewStoryVC: BaseVC {

    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Preference.set(value: false, forKey: .isFirstTimeLaunch)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = BackgroundVC()
        vc.delegate = self
        viewPopup(withViewController: vc, withView: editView, bg: .cyan)
    }


}

extension NewStoryVC: BackgroundVCDelegate {
    
    //change background
    func onBackgroundSelected(name: String) {
        self.backgroundImageView.image = UIImage(named: name)
    }
    
    
}
