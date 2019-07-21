//
//  RoleCell.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class PickRoleCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "PickRoleCell"
    
    var role: Role! {
        didSet {
            self.imageView.image = UIImage(named: role.name)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
