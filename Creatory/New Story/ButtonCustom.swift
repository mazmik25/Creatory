//
//  ButtonCustom.swift
//  Creatory
//
//  Created by khoirunnisa' rizky noor fatimah on 18/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class ButtonCustom: UIView {

//    static let instance = ButtonCustom()
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var charButton: UIButton!
    @IBOutlet weak var stickerButton: UIButton!
    @IBOutlet weak var record1Button: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var record2Button: UIButton!
    @IBOutlet weak var addPageButton: UIButton!
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var deletePageButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonsView()
    }

    func buttonsView() {
        homeButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        doneButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        imageButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        charButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        stickerButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        record1Button.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        record2Button.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        playButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        addPageButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
        deletePageButton.applyBorder(width: 2.0, color: #colorLiteral(red: 0.1529411765, green: 0.5411764706, blue: 1, alpha: 1), radius: .rounded)
    }
    
    
}
