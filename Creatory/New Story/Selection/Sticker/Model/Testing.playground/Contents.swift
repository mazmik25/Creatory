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
        stickers.append(Sticker(name: "cat", type: .natural))
        stickers.append(Sticker(name: "chair", type: .object))
        stickers.append(Sticker(name: "chicken", type: .natural))
        stickers.append(Sticker(name: "dog", type: .natural))
        stickers.append(Sticker(name: "doll", type: .object))
        stickers.append(Sticker(name: "double-bed", type: .object))
        stickers.append(Sticker(name: "double-flower", type: . natural))
        stickers.append(Sticker(name: "goat", type: .object))
        stickers.append(Sticker(name: "grass-1", type: .natural))
        stickers.append(Sticker(name: "grass-2", type: .natural))
        stickers.append(Sticker(name: "grass-3", type: .natural))
        stickers.append(Sticker(name: "hospital", type: .object))
        stickers.append(Sticker(name: "house", type: .object))
        stickers.append(Sticker(name: "lion", type: .natural))
        stickers.append(Sticker(name: "owl", type: .natural))
        stickers.append(Sticker(name: "robot", type: .object))
        stickers.append(Sticker(name: "school", type: .object))
        stickers.append(Sticker(name: "ball", type: .object))
        stickers.append(Sticker(name: "single-flower-1", type: .natural))
        stickers.append(Sticker(name: "single-flower-2", type: .natural))
        stickers.append(Sticker(name: "table", type: .object))
        stickers.append(Sticker(name: "train", type: .object))
        stickers.append(Sticker(name: "tree-1", type: .natural))
        stickers.append(Sticker(name: "tree-2", type: .natural))
        stickers.append(Sticker(name: "tree-3", type: .natural))
        
        return stickers
    }
}

let stickers = Sticker.getSticker()

let filteredSticker = stickers.filter { (sticker) -> Bool in
    sticker.type == .natural
}

filteredSticker.count
filteredSticker.forEach { (sticker) in
    print(sticker.name)
}
