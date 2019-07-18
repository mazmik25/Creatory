//
//  StickerVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

protocol StickerVCDelegate: class {
    func onStickerSelected(name: String)
}

class StickerVC: UIViewController {

    @IBOutlet weak var naturalView: UIView!
    @IBOutlet weak var objectView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: StickerVCDelegate?
    
    var filtered = [Sticker]()
    
    var stickerSelected: Int = 1 {
        didSet {
            self.filterSticker()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        filter(type: .natural)
    }
    
    private func setupView() {
        setupImageSelection()
        setupCollectionView()
    }
    
    private func setupImageSelection() {
        let naturalTap = UITapGestureRecognizer(target: self, action: #selector(naturalDidSelect))
        let objectTap = UITapGestureRecognizer(target: self, action: #selector(objectDidSelect))
        
        naturalView.addGestureRecognizer(naturalTap)
        objectView.addGestureRecognizer(objectTap)
        
        naturalView.applyBorder(radius: .rounded)
        objectView.applyBorder(radius: .rounded)
        
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: StickerCell.identifier, bundle: nil), forCellWithReuseIdentifier: StickerCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func filterSticker() {
        if stickerSelected == 1 {
            changeBackgroundColor(opacity1: 1, opacity2: 0.45)
        } else if stickerSelected == 2 {
            changeBackgroundColor(opacity1: 0.45, opacity2: 1)
        }
        filter(type: stickerSelected == 1 ? .natural : .object)
    }
    
    @objc private func naturalDidSelect() {
        stickerSelected = 1
    }
    
    @objc private func objectDidSelect() {
        stickerSelected = 2
    }

    private func changeBackgroundColor(opacity1: CGFloat, opacity2: CGFloat) {
        naturalView.backgroundColor = UIColor.blue.withAlphaComponent(opacity1)
        objectView.backgroundColor = UIColor.blue.withAlphaComponent(opacity2)
    }
    
    private func filter(type: StickerType) {
        filtered = Sticker.getSticker().filter { $0.type == type }
        collectionView.reloadData()
    }
}

extension StickerVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StickerCell.identifier, for: indexPath) as? StickerCell else { return UICollectionViewCell() }
        
//        cell.role = roles[indexPath.row]
        cell.sticker = filtered[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onStickerSelected(name: filtered[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 60.0)
    }
}