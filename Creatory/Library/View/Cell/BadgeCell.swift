//
//  BadgeCell.swift
//  Creatory
//
//  Created by Azmi Muhammad on 19/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {

    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "BadgeCell"
    
    var badge: Badge! {
        didSet {
            self.setupBadgeView(badge)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setupBadgeView(_ badge: Badge) {
        imageView.image = UIImage(named: badge.name ?? "Badges-1") ?? UIImage(named: "add")!
        layerView.isHidden = badge.isReceived
        self.contentView.applyBorder(radius: .rounded)
    }
}
