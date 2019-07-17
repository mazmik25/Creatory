//
//  LibraryCell.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import AVKit

protocol LibraryCellDelegate: class {
    func onNewStory()
    
    func onPreviewStory(at indexPath: IndexPath)
}

class LibraryCell: UICollectionViewCell {
    
    static let identifier = "LibraryCell"
    weak var delegate: LibraryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

}
