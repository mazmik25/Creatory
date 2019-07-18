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
    var tag: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Preference.set(value: false, forKey: .isFirstTimeLaunch)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPopup(withViewController: OnceUponVC(), withView: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissPopupOnTap))
        backgroundImageView.addGestureRecognizer(tap)
    }
    
    @objc func dismissPopupOnTap() {
        guard let tag = tag else { return }
        if let viewWithTag = editView.viewWithTag(tag) {
            viewWithTag.removeFromSuperview()
        }
    }

    @IBAction func onHomeSelected(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBackgroundSelected(_ sender: Any) {
        let vc = BackgroundVC()
        vc.delegate = self
        vc.view.tag = 1
        tag = 1
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onRoleSelected(_ sender: Any) {
        let vc = RoleVC()
        vc.delegate = self
        vc.view.tag = 2
        tag = 2
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onStickerSelected(_ sender: Any) {
        let vc = StickerVC()
        vc.delegate = self
        vc.view.tag = 3
        tag = 3
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
    
    func setupSticker(_ name: String) {
        let sticker = StickerView(frame: CGRect(x: 300, y: 150, width: 80, height: 80))
        sticker.image = UIImage(named: name)
        stickers.append(sticker)
        stickers.forEach { (sticker) in
            self.backgroundImageView.addSubview(sticker)
        }
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
        setupSticker(name)
    }
    
}

extension NewStoryVC: RolesVCDelegate {
    
    //add role to background image view
    func onRoleSelected(name: String) {
        setupSticker(name)
    }
    
}
