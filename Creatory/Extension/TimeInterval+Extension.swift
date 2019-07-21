//
//  String+Extension.swift
//  Creatory
//
//  Created by Azmi Muhammad on 19/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation

extension TimeInterval {
    func convertInterval() -> String {
        let time = Int(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
}
