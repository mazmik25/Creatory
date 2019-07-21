//
//  UIImageView+Extension.swift
//  Creatory
//
//  Created by Azmi Muhammad on 16/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import UIKit
import AVKit

extension UIImageView {
    func setupPreview(withPath path: String) {
        if !path.elementsEqual("") {
            let asset = AVURLAsset(url: NSURL(fileURLWithPath: path) as URL, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            do {
                let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
                
                self.image = UIImage(cgImage: cgImage)
            } catch {
                print(error)
            }
        }
    }
}
