//
//  LibraryVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class LibraryVC: BaseVC {

    @IBOutlet weak var badgesCollectionView: UICollectionView!
    @IBOutlet weak var libraryCollectionView: UICollectionView!
    
    var stories: [Story]?
    var badges: [Badge]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionViews()
        loadData()
    }
    
    private func setupCollectionViews() {
        libraryCollectionView.delegate = self
        libraryCollectionView.dataSource = self
        badgesCollectionView.delegate = self
        badgesCollectionView.dataSource = self
        
        libraryCollectionView.register(UINib(nibName: LibraryCell.identifier, bundle: nil), forCellWithReuseIdentifier: LibraryCell.identifier)
        badgesCollectionView.register(UINib(nibName: BadgeCell.identifier, bundle: nil), forCellWithReuseIdentifier: BadgeCell.identifier)
    }
    
    private func loadData() {
        loadBadges()
        loadStories()
    }
    
    private func loadBadges() {
        guard let context = getManagedContextObject() else { return }
        let badge = BadgeModel(context: context)
        badges = badge.getAll()
        badgesCollectionView.reloadData()
    }
    
    private func loadStories() {
        guard let context = getManagedContextObject() else { return }
        let story = StoryModel(context: context)
        stories = story.getAll()
        libraryCollectionView.reloadData()
    }

}

extension LibraryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == libraryCollectionView {
            guard let stories = stories, let _ = stories[0].videoPath else { return 1 }
            return stories.count + 1
        } else if collectionView == badgesCollectionView {
            guard let badges = badges else { return 0 }
            return badges.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == libraryCollectionView {
            return setupLibCell(collectionView, indexPath)
        } else if collectionView == badgesCollectionView {
            return setupBadgeCell(collectionView, indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == libraryCollectionView {
            return CGSize(width: 140.0, height: 80.0)
        } else if collectionView == badgesCollectionView {
            return CGSize(width: 90, height: 90)
        } else {
            return CGSize(width: 0.0, height: 0.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == libraryCollectionView {
            handleStory(indexPath)
        }
    }
    
    private func setupLibCell(_ cv: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cv.dequeueReusableCell(withReuseIdentifier: LibraryCell.identifier, for: indexPath) as? LibraryCell else { return UICollectionViewCell() }
    
        if let stories = stories, indexPath.row < stories.count, let path = stories[indexPath.row].videoPath {
            cell.imageView.setupPreview(withPath: path)
        } else {
            cell.imageView.image = UIImage(named: "add")!
        }
        
        let red  = CGFloat(39.0 / 255.0)
        let green  = CGFloat(138.0 / 255.0)
        let blue  = CGFloat(255 / 255.0)
        
        cell.contentView.applyBorder(width: 1.0, color: UIColor(red: red, green: green, blue: blue, alpha: 1.0), radius: .custom(0.0))
        return cell
    }
    
    private func setupBadgeCell(_ cv: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cv.dequeueReusableCell(withReuseIdentifier: BadgeCell.identifier, for: indexPath) as? BadgeCell, let badges = badges else { return UICollectionViewCell() }
        
        cell.badge = badges[indexPath.row]
        
        return cell
    }
    
    private func handleStory(_ indexPath: IndexPath) {
        if let stories = stories, indexPath.row < stories.count, let _ = stories[indexPath.row].videoPath {
            //preview
        } else {
            present(SelectRoleVC(), animated: true, completion: nil)
        }
    }
    
}
