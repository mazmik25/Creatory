//
//  PreviewVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import SAConfettiView

class PreviewVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //CoreDataEntity
    var story: Story!
    var page: Page!
    
    
    //Variables
    private var badgeImage: UIImageView!
    var titleText : String?
    var storyEntity = [Story]()
    var counting : Int?
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        playConfetti()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Play Confetti&Badge
    private func playConfetti() {
        let confettish = SAConfettiView(frame: CGRect(x: 198, y: 57, width: 500, height: 300))
        confettish.alpha = 0.7
        confettish.type = .Star
        confettish.startConfetti()
        confettish.tag = 100
        self.view.addSubview(confettish)
        let aSelector = #selector(PreviewVC.removeConfetti)
        let tap1 = UITapGestureRecognizer(target: self, action: aSelector)
        confettish.addGestureRecognizer(tap1)
    }
    @objc func removeConfetti(){
        if let viewWithTag = self.view.viewWithTag(100){
            viewWithTag.removeFromSuperview()
            if counting! % 2 != 0 {
                showBadge()
            }
        }
    }
    
    func showBadge() {
        badgeImage.image = UIImage(named: "Badges-\(counting!)")
        self.view.addSubview(badgeImage)
        badgeImage.centerXAnchor
        badgeImage.tag = 101
        UIView.animate(withDuration: 1) {
            self.badgeImage.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
        let bSelector : Selector = #selector(PreviewVC.removeBadgePopUp)
        let tap2 = UITapGestureRecognizer(target: self, action: bSelector)
        view.addGestureRecognizer(tap2)
    }
    @objc func removeBadgePopUp(){
        if let viewWithTag = self.view.viewWithTag(101){
            viewWithTag.removeFromSuperview()
            initBadge()
        }
    }
    
    private func commonInit(){
        homeButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        deleteButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        playButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        titleLabel.text = titleText!
    }
    
//    private func setUpCollectionView(){
//        collectionView.register(UINib(nibName: PreviewCell.Identity, bundle: nil), forCellWithReuseIdentifier: PreviewCell.Identity)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
    
    private func initBadge() {
        var count = Preference.getInt(forKey: .badgesCount)
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
        Preference.set(value: count, forKey: .badgesCount)
    }
    
    //MARK: CoreData SaveFunction
    private func saveBadge() {
        guard let context1 = getManagedContextObject() else { return }
        var badge = Badge(context: context1)
        badge.story = story
    }
    private func saveStory() {
        guard let context2 = getManagedContextObject() else { return }
        var stori = Story(context: context2)
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
