//
//  RoleVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

protocol RolesVCDelegate: class {
    func onRoleSelected(name: String)
}

class RoleVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: RolesVCDelegate?
    var roles = [Role]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlayers()
        setupCollectionView()
    }
    
    private func setupPlayers() {
        let playerOne = Role(name: Preference.getString(forKey: .playerOne) ?? "empty")
        let playerTwo = Role(name: Preference.getString(forKey: .playerTwo) ?? "empty")
        
        roles.append(playerOne)
        roles.append(playerTwo)
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: RoleCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoleCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
    
}

extension RoleVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoleCell.identifier, for: indexPath) as? RoleCell else { return UICollectionViewCell() }
        
        cell.role = roles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onRoleSelected(name: roles[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 150.0)
    }
}
