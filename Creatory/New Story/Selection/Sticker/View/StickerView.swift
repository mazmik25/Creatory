//
//  StickerView.swift
//  Creatory
//
//  Created by khoirunnisa' rizky noor fatimah on 18/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit

class StickerView: UIImageView {

    var lastLocation = CGPoint(x: 0, y: 0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(detectPan(_:)))
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchResizer(_:)))
    
        self.addGestureRecognizer(panRecognizer)
        self.addGestureRecognizer(pinchRecognizer)
        self.isUserInteractionEnabled = true
        self.superview?.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
    }
    
    @objc func detectPan(_ recognizer : UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.superview)
        self.center = CGPoint(x: translation.x + lastLocation.x, y: translation.y + lastLocation.y)
    }
    
    @objc func pinchResizer(_ sender : UIPinchGestureRecognizer) {
        self.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
}

