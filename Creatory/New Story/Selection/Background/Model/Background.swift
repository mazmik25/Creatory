//
//  Background.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation

struct Background {
    let name: String
    
    static func createBackgrounds() -> [Background] {
        var backgrounds = [Background]()
        
        backgrounds.append(Background(name: "camera thu"))
        backgrounds.append(Background(name: "white"))
        backgrounds.append(Background(name: "blue"))
        backgrounds.append(Background(name: "green"))
        backgrounds.append(Background(name: "orange"))
        backgrounds.append(Background(name: "pink"))
        backgrounds.append(Background(name: "snow"))
        backgrounds.append(Background(name: "star"))
        backgrounds.append(Background(name: "abstract-1"))
        backgrounds.append(Background(name: "abstract-2"))
        backgrounds.append(Background(name: "abstract-3"))
        backgrounds.append(Background(name: "fall"))
        backgrounds.append(Background(name: "cloud"))
        backgrounds.append(Background(name: "love"))
        backgrounds.append(Background(name: "night"))
        backgrounds.append(Background(name: "party"))
        backgrounds.append(Background(name: "rainbow"))
        backgrounds.append(Background(name: "yellow wave"))
        
        return backgrounds
    }
}
