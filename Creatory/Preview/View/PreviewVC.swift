//
//  PreviewVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import SAConfettiView
import AVKit

class PreviewVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var player: AVAudioPlayer?
    
    //CoreDataEntity
    var story: Story!
    var page: Page!
    
    
    //Variables
    var storyEntity = [Story]()
    var counting : Int?
    var stickerViews: [UIView]?
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        playConfetti()
        playSound("yay-congratulation", withExtension: ".wav")
        
        promptTitle()
    }
    
    private func commonInit() {
        homeButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        deleteButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        playButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        
        self.counting = Preference.getInt(forKey: .badgesCount) + 1
        
        guard let stickerViews = stickerViews else { return }
        stickerViews.forEach { (view) in
            self.bgView.addSubview(view)
        }
        let bg = Preference.getString(forKey: .background) ?? "white"
        self.bgView.image = UIImage(named: bg)
    }
    
    //MARK: Play Confetti&Badge
    private func playConfetti() {
        let confettiView = SAConfettiView(frame: CGRect(x: 198, y: 57, width: 500, height: 300))
        confettiView.alpha = 0.7
        confettiView.type = .Star
        confettiView.startConfetti()
        confettiView.tag = 100
        self.view.addSubview(confettiView)
    }
    
    private func promptTitle() {
        let vc = AlertVC()
        vc.delegate = self
        vc.view.tag = 1
        viewPopup(withViewController: vc, withView: nil)
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    private func initBadge() {
        guard let count = counting else { return }
        switch count {
        case 1:
            badgeView.image = UIImage(named: "Badges-1")
        case 3:
            badgeView.image = UIImage(named: "Badges-2")
        case 5:
            badgeView.image = UIImage(named: "Badges-3")
        case 7:
            badgeView.image = UIImage(named: "Badges-4")
        case 9:
            badgeView.image = UIImage(named: "Badges-5")
        case 11:
            badgeView.image = UIImage(named: "Badges-6")
        default:
            return
        }
        
        saveBadge()
        playSound("backsound")
        Preference.set(value: true, forKey: .isAudioPlaying)
//        Preference.set(value: count, forKey: .badgesCount)
    }
    
    //MARK: CoreData SaveFunction
    private func saveBadge() {
        guard let context1 = getManagedContextObject() else { return }
        let badge = Badge(context: context1)
    }
    
    private func saveStory() {
        guard let context2 = getManagedContextObject() else { return }
        let story = Story(context: context2)
    }
    
    @IBAction func onHomeTapped(_ sender: UIButton) {
        self.present(LibraryVC(), animated: true, completion: nil)
    }
    
}

extension PreviewVC: AlertVCDelegate, UIViewControllerTransitioningDelegate {
    
    func onCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSave(title: String) {
        titleLabel.text = title
        if let viewWithTag = view.viewWithTag(1) {
            viewWithTag.removeFromSuperview()
            removeConfetti()
        }
    }
    
    func removeConfetti() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
            if counting! % 2 != 0 {
                showBadge()
            }
        }
    }
    
    func showBadge() {
        playSound("badges-sound", withExtension: ".wav")
        let bg = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        bg.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        bg.tag = 101
        self.view.addSubview(bg)
        
        let badgeImage = UIImageView(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2, width: 75.0, height: 75.0))
        badgeImage.center = view.center
        badgeImage.image = UIImage(named: "Badges-\(counting ?? 1)")
        bg.addSubview(badgeImage)
        
        UIView.animate(withDuration: 0.5) {
            badgeImage.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeBadgePopUp))
        bg.addGestureRecognizer(tap)
    }
    
    @objc func removeBadgePopUp() {
        if let viewWithTag = self.view.viewWithTag(101) {
            viewWithTag.removeFromSuperview()
            initBadge()
        }
    }
}

extension PreviewVC {
    func playSound(_ name: String, withExtension of: String = ".mp3") {
        guard let url = Bundle.main.url(forResource: name, withExtension: of) else {
            print("url not found")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            if name.elementsEqual("backsound") {
                player!.numberOfLoops = -1
            }
            player!.play()
            
        } catch {
            print(error)
            player = nil
        }
    }
}


//MARK: Extension CollectionView
//extension PreviewVC: UICollectionViewDataSource, UICollectionViewDelegate {
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}
