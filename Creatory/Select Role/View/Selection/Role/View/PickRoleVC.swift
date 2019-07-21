//
//  RoleVC.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

protocol PickVCDelegate: class {
    func onRoleSelected(name: String, withPlayer id: Int)
}

class PickRoleVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: PickVCDelegate?
    let roles = Role.generateRoles()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: PickRoleCell.identifier, bundle: nil), forCellWithReuseIdentifier: PickRoleCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension PickRoleVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PickRoleCell.identifier, for: indexPath) as? RoleCell else { return UICollectionViewCell() }
        
        cell.role = roles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = id else { return }
        delegate?.onRoleSelected(name: roles[indexPath.row].name, withPlayer: id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 150.0)
    }
}
