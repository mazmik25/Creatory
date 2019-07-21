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
        
        Preference.set(value: true, forKey: .isFirstNotTimeLaunch)
        viewPopup(withViewController: OnceUponVC(), withView: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissPopupOnTap))
        backgroundImageView.addGestureRecognizer(tap)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        backgroundImageView.gestureRecognizers?.removeAll()
    }
    
    @objc func dismissPopupOnTap() {
        guard let tag = tag else { return }
        if let viewWithTag = editView.viewWithTag(tag) {
            viewWithTag.removeFromSuperview()
        }
    }

    @IBAction func onHomeSelected(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        let vc = RecordVC()
        vc.delegate = self
        vc.view.tag = 4
        tag = 4
        viewPopup(withViewController: vc, withView: editView)
    }
    
    @IBAction func onPlaySelected(_ sender: Any) {
        
    }
    
    @IBAction func onRecord2Selected(_ sender: Any) {
        
    }
    
    @IBAction func onAddPageSelected(_ sender: Any) {
        
    }
    
    @IBAction func onDoneSelected(_ sender: Any) {
        setupAlert()
    }
    
    private func setupAlert() {
        let alert = UIAlertController(title: "Message", message: "Are you sure?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.present(PreviewVC(), animated: true, completion: nil)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
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

extension NewStoryVC: RecordVCDelegate {
    
    //bring role to front
    func onRecording(playerId: Int) {
        
    }
    
    //dismiss background
    func onDoneRecording(path: String) {
        dismissPopupOnTap()
    }
    
}
