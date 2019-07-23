//
//  SelectRoleVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 19/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import AVKit

class SelectRoleVC: BaseVC {

    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var editOneView: UIView!
    @IBOutlet weak var editTwoView: UIView!
    @IBOutlet weak var roleOnePreviewIV: UIImageView!
    @IBOutlet weak var roleTwoPreviewIV: UIImageView!
    @IBOutlet weak var roleOneSelectedIV: UIImageView!
    @IBOutlet weak var roleTwoSelectedIV: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField!
    
    @IBOutlet weak var namingView: UIView!
    @IBOutlet weak var namingLabel: UILabel!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        if let isPlaying = Preference.getBool(forKey: .isAudioPlaying), !isPlaying {
            playSound("backsound")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addTapGestures()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeAllGestures()
    }
    
    private func setupView() {
        editOneView.applyBorder(radius: .rounded)
        editTwoView.applyBorder(radius: .rounded)
        
        homeView.applyBorder(width: 3.0, color: .blue, radius: .rounded)
        btnNext.applyBorder(width: 3.0, color: .blue, radius: .custom(12.0))
        
        playerOneTF.delegate = self
        playerTwoTF.delegate = self
    }
    
    private func addTapGestures() {
        let tapPreview = UITapGestureRecognizer(target: self, action: #selector(dismissSelection))
        let tapToHome = UITapGestureRecognizer(target: self, action: #selector(toHome))
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(editPlayerOne))
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(editPlayerTwo))
        
        editOneView.addGestureRecognizer(tapOne)
        editTwoView.addGestureRecognizer(tapTwo)
        mainView.addGestureRecognizer(tapPreview)
        homeView.addGestureRecognizer(tapToHome)
    }
    
    private func removeAllGestures() {
        editOneView.gestureRecognizers?.removeAll()
        editTwoView.gestureRecognizers?.removeAll()
        mainView.gestureRecognizers?.removeAll()
        homeView.gestureRecognizers?.removeAll()
    }
    
    @objc private func editPlayerOne() {
        setupRolePicker(1)
    }
    
    @objc private func editPlayerTwo() {
        setupRolePicker(2)
    }
    
    @objc private func toHome() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissSelection() {
        if let viewWithTag = previewView.viewWithTag(1) {
            viewWithTag.removeFromSuperview()
        }
    }

    @IBAction func onNextTapped(_ sender: UIButton) {
        if let player = player {
            player.stop()
        }
        
        Preference.set(value: false, forKey: .isAudioPlaying)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NewStoryVC") as! NewStoryVC
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func texfFieldOneChanged(_ sender: UITextField) {
        self.namingLabel.text = sender.text ?? ""
    }
    
    @IBAction func textFieldTwoChanged(_ sender: UITextField) {
        self.namingLabel.text = sender.text ?? ""
    }
    
    private func setupRolePicker(_ id: Int) {
        let vc = PickRoleVC()
        vc.delegate = self
        vc.view.tag = 1
        vc.id = id
        viewPopup(withViewController: vc, withView: previewView)
    }
}

extension SelectRoleVC: PickVCDelegate {
    
    func onRoleSelected(name: String, withPlayer id: Int) {
        switch id {
        case 1:
            self.roleOnePreviewIV.image = UIImage(named: name)
            self.roleOneSelectedIV.image = UIImage(named: name)
            Preference.set(value: name, forKey: .playerOne)
        case 2:
            self.roleTwoPreviewIV.image = UIImage(named: name)
            self.roleTwoSelectedIV.image = UIImage(named: name)
            Preference.set(value: name, forKey: .playerTwo)
        default:
            return
        }
    }

}

extension SelectRoleVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.namingView.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == playerOneTF {
            Preference.set(value: textField.text, forKey: .nameOne)
        } else if textField == playerTwoTF {
            Preference.set(value: textField.text, forKey: .nameTwo)
        }
        
        self.view.endEditing(true)
        self.namingView.isHidden = true
        self.namingLabel.text = "Give name for your character"
        return false
    }
    
}

extension SelectRoleVC {
    func playSound(_ name: String, withExtension of: String = ".mp3") {
        guard let url = Bundle.main.url(forResource: name, withExtension: of) else {
            print("url not found")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.numberOfLoops = -1
            player!.play()
            
        } catch let error as NSError {
            player = nil
        }
    }
}
