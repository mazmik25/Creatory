//
//  Sticker.swift
//  Creatory
//
//  Created by Azmi Muhammad on 17/07/19.
//  Copyright © 2019 Azmi Muhammad. All rights reserved.
//

import Foundation

enum StickerType {
    case natural
    case object
}

struct Sticker {
    let name: String
    let type: StickerType
    
    static func getSticker() -> [Sticker] {
        var stickers = [Sticker]()
        
        stickers.append(Sticker(name: "ball", type: .object))
        stickers.append(Sticker(name: "blocks", type: .object))
        stickers.append(Sticker(name: "car", type: .object))
        stickers.append(Sticker(name: "chair", type: .object))
        stickers.append(Sticker(name: "doll", type: .object))
        stickers.append(Sticker(name: "double-bed", type: .object))
        stickers.append(Sticker(name: "hospital", type: .object))
        stickers.append(Sticker(name: "house", type: .object))
        stickers.append(Sticker(name: "robot", type: .object))
        stickers.append(Sticker(name: "school", type: .object))
        stickers.append(Sticker(name: "ball", type: .object))
        stickers.append(Sticker(name: "table", type: .object))
        stickers.append(Sticker(name: "train", type: .object))
        
        stickers.append(Sticker(name: "Cat", type: .natural))
        stickers.append(Sticker(name: "Chicken", type: .natural))
        stickers.append(Sticker(name: "Dog", type: .natural))
        stickers.append(Sticker(name: "Goat", type: .natural))
        stickers.append(Sticker(name: "Lion", type: .natural))
        stickers.append(Sticker(name: "Owl", type: .natural))
        stickers.append(Sticker(name: "grass-1", type: .natural))
        stickers.append(Sticker(name: "grass-2", type: .natural))
        stickers.append(Sticker(name: "grass-3", type: .natural))
        stickers.append(Sticker(name: "single-flower-1", type: .natural))
        stickers.append(Sticker(name: "single-flower-2", type: .natural))
        stickers.append(Sticker(name: "double-flower", type: . natural))
        stickers.append(Sticker(name: "tree-1", type: .natural))
        stickers.append(Sticker(name: "tree-2", type: .natural))
        stickers.append(Sticker(name: "tree-3", type: .natural))
        
        return stickers
    }
}
