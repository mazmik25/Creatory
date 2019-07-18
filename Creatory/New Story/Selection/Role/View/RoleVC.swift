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
    let roles = Role.generateRoles()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: RoleCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoleCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension RoleVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoleCell.identifier, for: indexPath) as? RoleCell else { return UICollectionViewCell() }
        
        cell.role = roles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onRoleSelected(name: roles[indexPath.row].name)
    }
}
