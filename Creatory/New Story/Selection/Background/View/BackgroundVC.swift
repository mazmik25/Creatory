//
//  BackgroundVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

protocol BackgroundVCDelegate: class {
    func onBackgroundSelected(name: String)
}

class BackgroundVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let backgrounds = Background.createBackgrounds()
    weak var delegate: BackgroundVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: BackgroundCell.identifier, bundle: nil), forCellWithReuseIdentifier: BackgroundCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension BackgroundVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgrounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackgroundCell.identifier, for: indexPath) as? BackgroundCell else { return UICollectionViewCell() }
        
        cell.bg = backgrounds[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onBackgroundSelected(name: backgrounds[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 60.0)
    }
}
