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

    var stickers = [StickerView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Preference.set(value: false, forKey: .isFirstTimeLaunch)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPopup(withViewController: OnceUponVC(), withView: nil)
    }

    @IBAction func onHomeSelected(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBackgroundSelected(_ sender: Any) {
        let vc = BackgroundVC()
        vc.delegate = self
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onRoleSelected(_ sender: Any) {
        let vc = RoleVC()
        vc.delegate = self
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onStickerSelected(_ sender: Any) {
        let vc = StickerVC()
        vc.delegate = self
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onRecord1Selected(_ sender: Any) {
        
    }
    
    @IBAction func onPlaySelected(_ sender: Any) {
        
    }
    
    @IBAction func onRecord2Selected(_ sender: Any) {
        
    }
    
    @IBAction func onAddPageSelected(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NewStoryVC: BackgroundVCDelegate {
    
    //change background
    func onBackgroundSelected(name: String) {
        self.backgroundImageView.image = UIImage(named: name)
    }
    
}

extension NewStoryVC: StickerVCDelegate {
    
    //add sticker to background image view
    func onStickerSelected(name: String) {
        let sticker = StickerView(frame: CGRect(x: 300, y: 150, width: 60, height: 80))
        sticker.image = UIImage(named: name)
        stickers.append(sticker)
        stickers.forEach { (sticker) in
            self.backgroundImageView.addSubview(sticker)
        }
    }
    
}

extension NewStoryVC: RolesVCDelegate {
    
    //add role to background image view
    func onRoleSelected(name: String) {
        
    }
    
}
