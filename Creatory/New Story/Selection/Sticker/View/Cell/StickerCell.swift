
//
//  StickerCell.swift
//  Creatory
//
//  Created by Azmi Muhammad on 18/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class StickerCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "StickerCell"
    var sticker: Sticker! {
        didSet {
            imageView.image = UIImage(named: self.sticker.name)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
