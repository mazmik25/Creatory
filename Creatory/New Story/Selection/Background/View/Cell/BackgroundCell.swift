//
//  BackgroundCell.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class BackgroundCell: UICollectionViewCell {

    static let identifier = "BackgroundCell"
    @IBOutlet weak var imageView: UIImageView!
    
    var bg: Background! {
        didSet {
            self.imageView.image = UIImage(named: bg.name)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
