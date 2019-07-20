//
//  PushPreview.swift
//  Creatory
//
//  Created by Juansyah - on 20/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//
import UIKit

class PushPreview {
    func pushService() -> PreviewVC{
        let storyboard = UIStoryboard(name: "AlertPopUp", bundle: .main)
        let pushPVC = storyboard.instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
        return pushPVC
    }
}
